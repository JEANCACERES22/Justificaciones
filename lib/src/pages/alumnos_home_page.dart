import 'package:flutter/material.dart';
import 'package:justificaciones/src/bloc/alumnos_bloc.dart';
import 'package:justificaciones/src/bloc/provider.dart';
import 'package:justificaciones/src/models/alumnos_models.dart';
import 'package:justificaciones/src/widgets/menu_widget.dart';


class AlumnosHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   
    final alumnosBloc = Provider.alumnosBloc(context);
    alumnosBloc.cargarAlumnos();


    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Alumnos'),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      ),
      body: _crearListado(alumnosBloc),
      floatingActionButton: _crearBoton( context ),
    );
  }

  Widget _crearListado(AlumnosBloc alumnosBloc) {

    return StreamBuilder(
      stream: alumnosBloc.alumnosStream,
      builder: (BuildContext context, AsyncSnapshot<List<AlumnoModel>> snapshot) {
        
        if ( snapshot.hasData ) {

          final alumnos = snapshot.data;

          return ListView.builder(
            itemCount: alumnos.length,
            itemBuilder: (context, i) => _crearItem(context, alumnosBloc, alumnos[i] )
          );

        } else {
          return Center( child: CircularProgressIndicator() );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, AlumnosBloc alumnosBloc, AlumnoModel alumno) {

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: ( dirreccion ) => alumnosBloc.borrarAlumno(alumno.id),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: 
              Text('${ alumno.numcontrol } - ${ alumno.nombre }'
              '${ alumno.carrera } - ${ alumno.semestre }'
              '${ alumno.aula } - ${ alumno.grupo } - ${ alumno.turno } '),
              subtitle: Text( alumno.id ),
              onTap: () => Navigator.pushNamed(context, 'alumno', arguments: alumno ),
            ),
          ],
        ),
      )
    );




    

  }


  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon( Icons.add ),
      backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      onPressed: () => Navigator.pushNamed(context, 'alumno'),
    );
  }

}