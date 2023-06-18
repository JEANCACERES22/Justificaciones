import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:justificaciones/src/pages/Home_page.dart';

class AlumnoPage extends StatefulWidget {
  @override
  State<AlumnoPage> createState() => _AlumnoPageState();
}

class _AlumnoPageState extends State<AlumnoPage> {

  TextEditingController no_control = new TextEditingController();
  TextEditingController nombre = new TextEditingController();
  TextEditingController aula = new TextEditingController();
  TextEditingController grupo = new TextEditingController();
  TextEditingController semestre = new TextEditingController();
  TextEditingController carrera = new TextEditingController();

  String turno = "Matutino";

  Future register() async {
    var url = "http://192.168.101.9/justificaciones/registrar_alumnos.php";
    final response = await http.post(url, body: {
      "no_control": no_control.text,
      "nombre": nombre.text,
      "aula" : aula.text,
      "grupo" : grupo.text,
      "semestre" : semestre.text,
      "carrera": carrera.text,
      "turno" : turno,
    });
    final data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: 'Alumno ya existe',
          fontSize: 10, 
          textColor: Colors.red,
      );
    } else {
      Fluttertoast.showToast(
          msg: 'Alumno registrado',
          fontSize: 10, 
          textColor: Colors.green);
          
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),),);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Alumno'),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              child: Column(
                children: <Widget>[
                  _crearNombre(),
                  _crearAula(),
                  _crearNumControl(),
                  _crearGrupo(),
                  _crearSemestre(),
                  _crearCarrera(),
                  _crearTurno(),
                  _crearBoton()
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      controller: nombre
    );
  }

  Widget _crearAula() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: 'Aula'),
      controller: aula
    );
  }

  Widget _crearNumControl() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: 'Numero de control'),
      controller: no_control
    );
  }

  Widget _crearSemestre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Semestre'),
      controller: semestre,
    );
  }

  Widget _crearGrupo() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Grupo'),
      controller: grupo,
    );
  }

  Widget _crearCarrera() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Carrera'),
      controller: carrera,
    );
  }

  Widget _crearTurno() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(15.0)),
        Text('Turno'),
        RadioListTile(
                        title: Text("Matutino"),
                        value: "Matutino", 
                        groupValue: turno, 
                        onChanged: (value){
                          setState(() {
                              turno = value.toString();
                          });
                        },
                    ),

                RadioListTile(
                    title: Text("Vespertino"),
                    value: "Vespertino", 
                    groupValue: turno, 
                    onChanged: (value){
                      setState(() {
                          turno = value.toString();
                      });
                    },
                ),
     ],
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
      onPressed: () {
        register();
      },
    );
  }
}
