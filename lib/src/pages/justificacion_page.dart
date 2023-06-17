import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/justifRegistro_page.dart';
import 'package:justificaciones/src/widgets/menu_widget.dart';
import 'package:selectable_list/selectable_list.dart';


class JustificaionesPage extends StatefulWidget {

  @override
  State<JustificaionesPage> createState() => _JustificaionesPageState();
}

class _JustificaionesPageState extends State<JustificaionesPage> {

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _nombre = '';
  String _grupo = '';
  String _semestre = '';
  String _carrera = '';

  
  bool _guardando = false;

  List<String> _turno = ["Matutino", "Vespertino"];
  String _selectedTurno = "Matutino";

  final Motivos = [
    Motivo("Enfermedad"),
    Motivo("Familiar"),
    Motivo("Examen en otra escuela")
  ];

  String selectedMotivo;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Menu(),
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Registrar Maestros'),
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
                  _crearGrupo(),
                  _crearSemestre(),
                  _crearCarrera(),
                  _crearTurno(),
                  _crearmotivo(), 
                  _crearBoton()
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onChanged: (value) {
        setState(() {
           _nombre = value;
        });
      },
    );
  }

  Widget _crearSemestre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Semestre'),
      onChanged: (value) {
        setState(() {
           _semestre = value;
        });
      },
    );
  }

  Widget _crearGrupo() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Grupo'),
      onChanged: (value) {
        setState(() {
           _grupo = value;
        });
      },
    );
  }

  Widget _crearCarrera() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Carrera'),
      onChanged: (value) {
        setState(() {
           _carrera = value;
        });
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

  Widget _crearmotivo() {
    return SelectableList<Motivo, String>(
        items: Motivos,
        itemBuilder: (context, moti, selected, onTap) => ListTile(
            title: Text(moti.name),
            selected: selected,
            onTap: onTap),
        valueSelector: (motivo) => motivo.name,
        selectedValue: selectedMotivo,
        onItemSelected: (motivo) =>
            setState(() => selectedMotivo = motivo.name),
        onItemDeselected: (motivo) => setState(() => selectedMotivo = null),
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      
    });

    // setState(() {_guardando = false;});
    mostrarSnackbar('Registro guardado');

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => JustificacionesHomePage()
    ));

  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

 }

 class Motivo {
    final String name;

    Motivo(this.name);
  }
