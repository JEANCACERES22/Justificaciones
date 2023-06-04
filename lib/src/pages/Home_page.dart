import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/Login_page.dart';
import 'package:justificaciones/src/pages/alumnos_page.dart';
import 'package:justificaciones/src/pages/buscador_page.dart';
import 'package:justificaciones/src/pages/docentes_page.dart';
import 'package:justificaciones/src/pages/justifRegistro_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDrawerExpanded = false;

  String _nombre = 'Usuario';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-user-icon-png-image_1796659.jpg'),
          ),
        ],
        title: Text('Bienvenido ${_nombre}'),
      ),
      body: Container(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(128, 0, 0, 1.0),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: -18,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/LogoCBTIS.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(128, 0, 0, 1.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.search, color: Colors.black),
              title: Text('Busqueda'),
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.black),
              title: Text('Registro maestros'),
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegistroPage()));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_ind, color: Colors.black),
              title: Text(' Registro alumnos'),
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistroAlumnoPage()));
                });
              },
            ),
            ListTile(
              leading: Icon(
                Icons.assignment_add,
                color: Colors.black,
              ),
              title: Text('Registro justificacion'),
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage2()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
