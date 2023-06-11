import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/Home_page.dart';
import 'package:justificaciones/src/pages/alumnos_home_page.dart';
import 'package:justificaciones/src/pages/buscador_page.dart';
import 'package:justificaciones/src/pages/docentes_home_page.dart';
import 'package:justificaciones/src/pages/justifRegistro_page.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('CBTIS 72', selectionColor: Colors.white), 
            accountEmail: Text('Andrés Quintana Roo', selectionColor: Colors.white),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png',),
                radius: 25.0,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/vino.jpg'), fit: BoxFit.cover)
            ),
          ),
          ListTile(
            leading: Icon(Icons.home), iconColor: Color.fromRGBO(128, 0, 0, 1.0),
            title: Text('Home'), textColor: Colors.black,
            onTap: () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomePage(),
              )),
          ),
          ListTile(
            leading: Icon(Icons.person_add), iconColor: Color.fromRGBO(128, 0, 0, 1.0),
            title: Text('Agregar Alumnos'), textColor: Colors.black,
            onTap: () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AlumnosHomePage(),
              )),
          ),
          ListTile(
            leading: Icon(Icons.person_add_alt_1), iconColor: Color.fromRGBO(128, 0, 0, 1.0),
            title: Text('Agregar Docentes'), textColor: Colors.black,
            onTap: () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => DocentesHomePage(),
              )),
          ),
          ListTile(
            leading: Icon(Icons.note_add_rounded), iconColor: Color.fromRGBO(128, 0, 0, 1.0),
            title: Text('Agregar Justificación'), textColor: Colors.black,
            onTap: () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => JustificacionesPage(),
              )),
          ),
          ListTile(
            leading: Icon(Icons.search), iconColor: Color.fromRGBO(128, 0, 0, 1.0),
            title: Text('Busqueda'), textColor: Colors.black,
            onTap: () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SearchPage(),
              )),
          ),
        ],
      ),
    );
  }
 
}
