import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/maestro_page.dart';
import 'package:justificaciones/src/widgets/menu_widget.dart';


class MaestrosHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Docentes'),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      ),
      body: _crearItem(),
      floatingActionButton: _crearBoton( context ),
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
              title: 
              Text('Casimiro Uuh Echeverria'
              'Matematicas Aplicadas - Matutino'
              ''),
              subtitle: Text( 'NAHHSWGYWTYT788' ),
            ),
          ],
        ),
      )
    );




    

  }


  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon( Icons.add ),
      backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DocentePage()),
        );
      }
    );
  }

}