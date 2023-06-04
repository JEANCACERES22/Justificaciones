import 'package:flutter/material.dart';

class RegistroAlumnoPage extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController semestreController = TextEditingController();
  final TextEditingController aulaController = TextEditingController();
  final TextEditingController carreraController = TextEditingController();

  bool isMatutino = false;
  bool isVespertino = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
        title: Text('Registro de Alumnos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: semestreController,
                  decoration: InputDecoration(labelText: 'Semestre'),
                ),
                TextField(
                  controller: aulaController,
                  decoration: InputDecoration(labelText: 'Aula'),
                ),
                TextField(
                  controller: carreraController,
                  decoration: InputDecoration(labelText: 'Carrera'),
                ),
                ExpansionTile(
                  title: Text('Grupos'),
                  children: [
                    ListTile(
                      title: Text('Grupo A'),
                      onTap: () {
                        print('grupo A');
                      },
                    ),
                    ListTile(
                      title: Text('Grupo B'),
                      onTap: () {
                        print('grupo B');
                      },
                    ),
                    ListTile(
                      title: Text('Grupo c'),
                      onTap: () {
                        print('grupo C');
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isMatutino,
                      onChanged: (value) {
                        isMatutino = value!;
                      },
                    ),
                    Text('Matutino'),
                    Checkbox(
                      value: isVespertino,
                      onChanged: (value) {
                        isVespertino = value!;
                      },
                    ),
                    Text('Vespertino'),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Acción al hacer clic en "Registrar"
                    String nombre = nombreController.text;
                    String semestre = semestreController.text;
                    String aula = aulaController.text;
                    String carrera = carreraController.text;

                    String turno = '';
                    if (isMatutino && isVespertino) {
                      turno = 'Matutino y Vespertino';
                    } else if (isMatutino) {
                      turno = 'Matutino';
                    } else if (isVespertino) {
                      turno = 'Vespertino';
                    }

                    print('Nombre: $nombre');
                    print('Semestre: $semestre');
                    print('Aula: $aula');
                    print('Carrera: $carrera');
                    print('Turno: $turno');
                  },
                  child: Text(
                    'Registrar',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
