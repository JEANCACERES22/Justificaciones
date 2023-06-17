import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:justificaciones/src/pages/Home_page.dart';


class EditarAlumno extends StatefulWidget {
  final List list;
  final int index;

  EditarAlumno({this.list, this.index});

  @override
  _EditarAlumnoState createState() => new _EditarAlumnoState();
}

class _EditarAlumnoState extends State<EditarAlumno> {

  TextEditingController num_control ;
  TextEditingController nom_alum ;
  TextEditingController aula ;
  TextEditingController semestre ;
  TextEditingController grupo ;
  TextEditingController carrera ;

  String turno = 'Matutino';
  


  void editar() {
    var url="http://192.168.101.9/justificaciones/editar_alumnos.php";
    http.post(url,body: {
      "id": widget.list[widget.index]['id'],
      "num_control": num_control.text,
      "nom_alum": nom_alum.text,
      "aula" : aula.text,
      "grupo" : grupo.text,
      "turno": turno,
      "semestre" : semestre.text,
      "carrera" : carrera.text,
    });
    var response;
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: 'Error',
          fontSize: 10, 
          textColor: Colors.red,
      );
    } else {
          
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
  }


  @override
    void initState() {
      num_control = new TextEditingController(text: widget.list[widget.index]['num_control'] );
      nom_alum = new TextEditingController(text: widget.list[widget.index]['nom_alum'] );
      aula = new TextEditingController(text: widget.list[widget.index]['aula'] );
      grupo = new TextEditingController(text: widget.list[widget.index]['grupo'] );
      turno = turno;
      semestre = new TextEditingController(text: widget.list[widget.index]['semestre'] );
      carrera = TextEditingController(text: widget.list[widget.index]['carrera']);
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDITAR"),
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
      controller: nom_alum,
      validator: (value) {
        if (value.isEmpty) return "Ingresa el nombre";
      },
    );
  }

  Widget _crearAula() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: 'Aula'),
      controller: aula,
      validator: (value) {
        if (value.isEmpty) return "Ingresa el aula";
      },
    );
  }

  Widget _crearNumControl() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: 'Numero de control'),
      controller: num_control,
      validator: (value) {
        if (value.isEmpty) return "Ingresa el numero de control";
      },
    );
  }

  Widget _crearSemestre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Semestre'),
      controller: semestre,
      validator: (value) {
        if (value.isEmpty) return "Ingresa el semestre";
      },
    );
  }

  Widget _crearGrupo() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Grupo'),
      controller: grupo,
      validator: (value) {
        if (value.isEmpty) return "Ingresa el grupo";
      },
    );
  }

  Widget _crearCarrera() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Carrera'),
      controller: carrera,
      validator: (value) {
        if (value.isEmpty) return "Ingresa la carrera";
      },
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
                editar();
              },
    );
  }

}