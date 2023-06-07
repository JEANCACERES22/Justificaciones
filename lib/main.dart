import 'package:flutter/material.dart';
import 'package:justificaciones/src/bloc/provider.dart';
import 'package:justificaciones/src/pages/Login_page.dart';
import 'package:justificaciones/src/pages/alumnos_page.dart';
import 'package:justificaciones/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); 

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final prefs = new PreferenciasUsuario();
    print( prefs.token );

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          // 'registro': (BuildContext context) => RegistroPage(),
          // 'home': (BuildContext context) => HomePage(),
          'alumno': (BuildContext context) => AlumnoPage(),
        },
        theme: ThemeData(
          primaryColor: Color.fromRGBO(128, 0, 0, 1.0),
        ),
      ),
    );
  }
}
