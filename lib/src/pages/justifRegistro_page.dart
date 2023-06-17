import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/justificacion_page.dart';
import 'package:justificaciones/src/widgets/menu_widget.dart';

class JustificacionesHomePage extends StatefulWidget {
  @override
  _JustificacionesHomePageState createState() =>
      _JustificacionesHomePageState();
}

class _JustificacionesHomePageState extends State<JustificacionesHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Justificaciones'),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      ),
      body: _crearItem(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearItem() {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Hannia Chable - '
                    'sexto - 6A - Programación - Matutino'
                    ''),
                subtitle: Text('Motivo familiar'),
              ),
            ],
          ),
        ));
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JustificaionesPage()),
          );
        });
  }
}
