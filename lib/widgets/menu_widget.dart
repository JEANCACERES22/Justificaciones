import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/Home_page.dart';
import 'package:justificaciones/src/pages/alumnos_home_page.dart';

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
                backgroundImage: AssetImage('assets/logo.png'),
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
        ],
      ),
    );
  }
 
}
