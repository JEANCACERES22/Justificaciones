import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/maestro_home_page.dart';
import 'package:justificaciones/widgets/menu_widget.dart';

class DocentePage extends StatefulWidget {
  @override
  _DocentePageState createState() => _DocentePageState();
}

class _DocentePageState extends State<DocentePage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _nombre = '';
  String _asignatura = '';
  String _contacto = '';

  
  bool _guardando = false;

  List<String> _turno = ["Matutino", "Vespertino"];
  String _selectedTurno = "Matutino";
  
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
                  _crearAsignatura(),
                  _crearContacto(),
                  _crearTurno(),
                  _crearGrupos(),
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

  Widget _crearAsignatura() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Asignatura'),
      onChanged: (value) {
        setState(() {
           _asignatura = value;
        });
      },
    );
  }

  Widget _crearContacto() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Correo electrónico o Teléfono'),
      onChanged: (value) {
        setState(() {
           _contacto = value;
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

  Widget _crearGrupos() {
     return TextFormField(
       decoration: InputDecoration(labelText: 'Grupos'),
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

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      
    });

    // setState(() {_guardando = false;});
    mostrarSnackbar('Registro guardado');

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => MaestrosHomePage()
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
