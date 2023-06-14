
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:justificaciones/src/models/docentes_model.dart';
import 'package:justificaciones/src/preferencias_usuario/preferencias_usuario.dart';

import 'package:mime_type/mime_type.dart';

class DocentesProvider {

  final String _url = 'https://app-justificacion-default-rtdb.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearDocente( DocentesModel docente ) async {

    final url = Uri.parse('$_url/maestros.json?auth=${ _prefs.token }');

    final resp = await http.post(url, body: docenteModelToJson(docente));

    final decodedData = json.decode(resp.body);

    print( decodedData);

    return true;

  }

  Future<bool> editarDocente( DocentesModel docente ) async {

    final url = Uri.parse('$_url/maestros/${ docente.id }.json?auth=${ _prefs.token }');

    final resp = await http.put(url, body: docenteModelToJson(docente));

    final decodedData = json.decode(resp.body);

    print( decodedData);

    return true;

  }

  Future<List<DocentesModel>> cargarDocentes() async {

    final url = Uri.parse('$_url/maestros.json?auth=${ _prefs.token }');
    
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    
    final List<DocentesModel> docentes = [];


    if ( decodedData == null ) return [];

    if ( decodedData['error'] != null ) return [];

    decodedData.forEach( (id, doc) {
      
      final docTemp = DocentesModel.fromJson(doc);
      docTemp.id = id;

      docentes.add(docTemp);

    });


    return docentes;

  }


  Future<int> borrarDocente(String id) async {

    final url = Uri.parse('$_url/maestros/$id.json?auth=${ _prefs.token }');
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  }


}

