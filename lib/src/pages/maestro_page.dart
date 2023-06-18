import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:justificaciones/src/pages/maestro_home_page.dart';
import 'package:justificaciones/src/widgets/menu_widget.dart';

class DocentePage extends StatefulWidget {
  @override
  _DocentePageState createState() => _DocentePageState();
}

class _DocentePageState extends State<DocentePage> {
  TextEditingController nom_mtro = new TextEditingController();
  TextEditingController asignatura = new TextEditingController();
  TextEditingController contacto = new TextEditingController();

  String turno = "Matutino";

  Future register() async {
    var url = "http://192.168.101.9/justificaciones/registrar_maestros.php";
    final response = await http.post(url, body: {
      "nom_mtro": nom_mtro.text,
      "asigturas": asignatura.text,
      "contacto": contacto.text,
      "turno": turno,
      //"grupos": grupo
    });
    final data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        msg: 'Maestro ya existe',
        fontSize: 10,
        textColor: Colors.red,
      );
    } else {
      Fluttertoast.showToast(
          msg: 'Maestro registrado', fontSize: 10, textColor: Colors.green);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MaestrosHomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Registrar Maestros'),
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
        register();
      },
    );
  }
}
