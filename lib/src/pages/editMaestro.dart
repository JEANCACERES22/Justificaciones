import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:justificaciones/src/pages/Home_page.dart';

class EditarMaestro extends StatefulWidget {
  final List list;
  final int index;

  EditarMaestro({this.list, this.index});

  @override
  _EditarMaestroState createState() => new _EditarMaestroState();
}

class _EditarMaestroState extends State<EditarMaestro> {
  TextEditingController nom_mtro;
  TextEditingController asignatura;
  TextEditingController contacto;

  String turno = 'Matutino';

  void editar() {
    var url = "http://192.168.101.9/justificaciones/editar_alumnos.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nom_mtro": nom_mtro.text,
      "asigturas": asignatura.text,
      "contacto": contacto.text,
      "turno": turno,
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  void initState() {
    nom_mtro =
        new TextEditingController(text: widget.list[widget.index]['nom_mtr']);
    asignatura = new TextEditingController(
        text: widget.list[widget.index]['asignatura']);
    contacto =
        new TextEditingController(text: widget.list[widget.index]['contacto']);
    turno = turno;
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
              _crearAsignatura(),
              _crearContacto(),
              _crearTurno(),
              // _crearGrupos(),
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
      controller: nom_mtro,
    );
  }

  Widget _crearAsignatura() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Asignatura'),
      controller: asignatura,
    );
  }

  Widget _crearContacto() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Correo electrónico o Teléfono'),
      controller: contacto,
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
          onChanged: (value) {
            setState(() {
              turno = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text("Vespertino"),
          value: "Vespertino",
          groupValue: turno,
          onChanged: (value) {
            setState(() {
              turno = value.toString();
            });
          },
        ),
      ],
    );
  }

  // Widget _crearGrupos() {
  //  return TextFormField(
  //    decoration: InputDecoration(labelText: 'Grupos'),
  //  );
  // }

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
