
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:justificaciones/src/models/alumnos_models.dart';
import 'package:justificaciones/src/preferencias_usuario/preferencias_usuario.dart';

import 'package:mime_type/mime_type.dart';

class AlumnosProvider {

  final String _url = 'https://app-justificacion-default-rtdb.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearAlumno( AlumnoModel alumno ) async {

    final url = Uri.parse('$_url/alumnos.json?auth=${ _prefs.token }');

    final resp = await http.post(url, body: alumnoModelToJson(alumno));

    final decodedData = json.decode(resp.body);

    print( decodedData);

    return true;

  }

  Future<bool> editarAlumno( AlumnoModel alumno ) async {

    final url = Uri.parse('$_url/alumnos/${ alumno.id }.json?auth=${ _prefs.token }');

    final resp = await http.put(url, body: alumnoModelToJson(alumno));

    final decodedData = json.decode(resp.body);

    print( decodedData);

    return true;

  }

  Future<List<AlumnoModel>> cargarAlumnos() async {

    final url = Uri.parse('$_url/alumnos.json?auth=${ _prefs.token }');
    
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    
    final List<AlumnoModel> alumnos = [];


    if ( decodedData == null ) return [];

    if ( decodedData['error'] != null ) return [];

    decodedData.forEach( (id, alum) {
      
      final alumTemp = AlumnoModel.fromJson(alum);
      alumTemp.id = id;

      alumnos.add(alumTemp);

    });

    return alumnos;

  }


  Future<int> borrarAlumno(String id) async {

    final url = Uri.parse('$_url/alumnos/$id.json?auth=${ _prefs.token }');
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  }


}

