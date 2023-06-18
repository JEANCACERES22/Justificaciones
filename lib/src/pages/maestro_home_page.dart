import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:justificaciones/src/pages/detalles_maestros.dart';
import 'package:justificaciones/src/widgets/menu_widget.dart';


class MaestrosHomePage extends StatefulWidget {

  @override
  State<MaestrosHomePage> createState() => _MaestrosHomePageState();
}

class _MaestrosHomePageState extends State<MaestrosHomePage> {
   Future<List> getData() async {
    final response = await http.get("http://192.168.101.9/justificaciones/listado_maestros.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Mestros'),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      onPressed: () => Navigator.pushNamed(context, 'maestro'),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new DetallesMestros(
                            list: list,
                            index: i,
                          )),
                ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['nom_mtro'],
                  style: TextStyle(fontSize: 20.0, color: Color.fromRGBO(128, 0, 0, 1.0)),
                ),
                leading: new Icon(
                  Icons.person_pin,
                  size: 45.0,
                  color: Color.fromRGBO(128, 0, 0, 1.0),
                ),
                subtitle: new Text(
                  "Asignatura : ${list[i]['asignaturas']}",
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

