import 'package:flutter/material.dart';
import 'package:justificaciones/src/bloc/docentes_bloc.dart';
import 'package:justificaciones/src/bloc/provider.dart';
import 'package:justificaciones/src/models/docentes_model.dart';

class DocentePage extends StatefulWidget {
  @override
  _DocentePageState createState() => _DocentePageState();
}

class _DocentePageState extends State<DocentePage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  DocentesBloc docentesBloc;
  DocentesModel docente = new DocentesModel();
  bool _guardando = false;

  List<String> _turno = ["Matutino", "Vespertino"];
  String _selectedTurno = "Matutino";
  
  @override
  Widget build(BuildContext context) {
    docentesBloc = Provider.docentesBloc(context);

    final docData = ModalRoute.of(context).settings.arguments;
    if (docData != null) {
      docente = docData as DocentesModel;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Registrar alumnos'),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _crearNombre(),
                  _crearAsignatura(),
                  _crearContacto(),
                  _crearTurno(),
                  // _crearGrupos(),
                  _crearBoton()
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: docente.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => docente.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa el nombre del alumno';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearAsignatura() {
    return TextFormField(
      initialValue: docente.asignatura,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Asignatura'),
      onSaved: (value) => docente.asignatura = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa el semestre';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearContacto() {
    return TextFormField(
      initialValue: docente.contacto,
      decoration: InputDecoration(labelText: 'Correo electrónico o Teléfono'),
      onSaved: (value) => docente.contacto = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa la carrera';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearTurno() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Text("Turno"),
        for(int i = 0; i < _turno.length; i++) 
        Row(
          children: [
            Radio(
              value: _turno[i], 
              groupValue: _selectedTurno, 
              onChanged: (value) {
                setState(() {
                  _selectedTurno = value.toString();
                });
              }),
              Text(_turno[i]),
          ],
        )
      ],
    );
  }

  // Widget _crearGrupos() {
  //  return TextFormField(
  //    initialValue: alumno.grupo,
  //    decoration: InputDecoration(labelText: 'Grupo'),
  //    onSaved: (value) => alumno.grupo = value,
  //    validator: (value) {
  //      if (value.length < 2) {
  //        return 'Ingresa el grupo';
  //      } else {
  //         return null;
  //      }
  //    },
  //  );
  //}

  Widget _crearBoton() {
    return ElevatedButton.icon(
      label: Text('Guardar'),
      icon: Icon(Icons.save, color: Colors.white),
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          primary: Color.fromRGBO(128, 0, 0, 1.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      
    });

    // setState(() {_guardando = false;});
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context, 'home_docente');
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

 }
