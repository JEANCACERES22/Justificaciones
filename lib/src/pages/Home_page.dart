import 'package:flutter/material.dart';
import 'package:justificaciones/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
          title: const Text(''),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bienvenido al Sistema de Justificaciones', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15)),
              Text('Del CBTis 72', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15)),
              Text('Andres Quintana Roo', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15)),
            ],
            
          ),
        ),
      ),
    );
  }
}