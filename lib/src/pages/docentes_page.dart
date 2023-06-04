import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  bool _esMatutino = false;
  bool _esVespertino = false;
  String _nombre = '';
  String _asignatura = '';
  String _contacto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
        title: Text('Página de Registro de maestros'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          elevation: 4.0,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _nombre = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Asignatura',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _asignatura = value;
                    });
                  },
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _esMatutino,
                      onChanged: (value) {
                        setState(() {
                          _esMatutino = value!;
                        });
                      },
                    ),
                    Text('Matutino'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _esVespertino,
                      onChanged: (value) {
                        setState(() {
                          _esVespertino = value!;
                        });
                      },
                    ),
                    Text('Vespertino'),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico o Teléfono',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _contacto = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red[700]),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Registrarse'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
