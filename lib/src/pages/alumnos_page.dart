import 'package:flutter/material.dart';
import 'package:justificaciones/src/bloc/alumnos_bloc.dart';
import 'package:justificaciones/src/bloc/provider.dart';
import 'package:justificaciones/src/models/alumnos_models.dart';

import 'package:justificaciones/src/utils/utils.dart' as utils;

class AlumnoPage extends StatefulWidget {
  @override
  State<AlumnoPage> createState() => _AlumnoPageState();
}

class _AlumnoPageState extends State<AlumnoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  AlumnosBloc alumnosBloc;
  AlumnoModel alumno = new AlumnoModel();
  bool _guardando = false;

  List<String> _turno = ["Matutino", "Vespertino"];
  String _selectedTurno = "Matutino";
  
  @override
  Widget build(BuildContext context) {
    alumnosBloc = Provider.alumnosBloc(context);

    final alumData = ModalRoute.of(context).settings.arguments;
    if (alumData != null) {
      alumno = alumData as AlumnoModel;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Registrar alumnos'),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _crearNumcontrol(),
                  _crearNombre(),
                  _crearAula(),
                  _crearSemestre(),
                  _crearCarrera(),
                  _crearTurno(),
                  _crearGrupo(),
                  _crearBoton()
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNumcontrol() {
    return TextFormField(
      initialValue: alumno.numcontrol.toString(),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: 'Numero de control'),
      onSaved: (value) => alumno.numcontrol = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Sólo números';
        }
      },
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: alumno.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => alumno.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa el nombre del alumno';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearAula() {
    return TextFormField(
      initialValue: alumno.aula.toString(),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: 'Aula'),
      onSaved: (value) => alumno.aula = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Sólo números';
        }
      },
    );
  }

  Widget _crearSemestre() {
    return TextFormField(
      initialValue: alumno.semestre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Semestre'),
      onSaved: (value) => alumno.semestre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa el semestre';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearCarrera() {
    return TextFormField(
      initialValue: alumno.carrera,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Carrera'),
      onSaved: (value) => alumno.carrera = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa la carrera';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearTurno() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Text("Turno"),
        for(int i = 0; i < _turno.length; i++) 
        Row(
          children: [
            Radio(
              value: _turno[i], 
              groupValue: _selectedTurno, 
              onChanged: (value) {
                setState(() {
                  _selectedTurno = value.toString();
                });
              }),
              Text(_turno[i]),
          ],
        )
      ],
    );
  }

  Widget _crearGrupo() {
    return TextFormField(
      initialValue: alumno.grupo,
      decoration: InputDecoration(labelText: 'Grupo'),
      onSaved: (value) => alumno.grupo = value,
      validator: (value) {
        if (value.length < 2) {
          return 'Ingresa el grupo';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return ElevatedButton.icon(
      label: Text('Guardar'),
      icon: Icon(Icons.save, color: Colors.white),
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          primary: Color.fromRGBO(128, 0, 0, 1.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      
    });

    // setState(() {_guardando = false;});
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

}
