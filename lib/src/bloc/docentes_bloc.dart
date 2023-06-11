import 'dart:io';


import 'package:justificaciones/src/models/docentes_model.dart';
import 'package:justificaciones/src/providers/docentes_provider.dart';
import 'package:rxdart/rxdart.dart';


class DocentesBloc {

  final _docentesController = new BehaviorSubject<List<DocentesModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _docentesProvider = new DocentesProvider();


  Stream<List<DocentesModel>> get docentesStream => _docentesController.stream;
  Stream<bool> get cargando => _cargandoController.stream;



  void cargarDocentes() async {

    final docentes = await _docentesProvider.cargarDocentes();
    _docentesController.sink.add( docentes );
  }


  void agregarDocente ( DocentesModel docente ) async {

    _cargandoController.sink.add(true);
    await _docentesProvider.crearDocente(docente);
    _cargandoController.sink.add(false);

  }


  void editarDocente ( DocentesModel docente ) async {

    _cargandoController.sink.add(true);
    await _docentesProvider.editarDocente(docente);
    _cargandoController.sink.add(false);

  }

  void borrarDocente ( String id ) async {

    await _docentesProvider.borrarDocente(id);


  }


  dispose() {
    _docentesController?.close();
    _cargandoController?.close();
  }

}