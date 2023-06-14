import 'dart:io';

import 'package:justificaciones/src/models/alumnos_models.dart';
import 'package:justificaciones/src/providers/alumnos_provider.dart';
import 'package:rxdart/rxdart.dart';


class AlumnosBloc {

  final _alumnosController = new BehaviorSubject<List<AlumnoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _alumnosProvider = new AlumnosProvider();


  Stream<List<AlumnoModel>> get alumnosStream => _alumnosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;



  void cargarAlumnos() async {

    final alumnos = await _alumnosProvider.cargarAlumnos();
    _alumnosController.sink.add( alumnos );
  }


  void agregarAlumno ( AlumnoModel alumno ) async {

    _cargandoController.sink.add(true);
    await _alumnosProvider.crearAlumno(alumno);
    _cargandoController.sink.add(false);

  }


  void editarAlumno ( AlumnoModel alumno ) async {

    _cargandoController.sink.add(true);
    await _alumnosProvider.editarAlumno(alumno);
    _cargandoController.sink.add(false);

  }

  void borrarAlumno ( String id ) async {

    await _alumnosProvider.borrarAlumno(id);


  }


  dispose() {
    _alumnosController?.close();
    _cargandoController?.close();
  }

}