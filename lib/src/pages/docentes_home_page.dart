import 'package:flutter/material.dart';
import 'package:justificaciones/src/bloc/docentes_bloc.dart';
import 'package:justificaciones/src/bloc/provider.dart';
import 'package:justificaciones/src/models/docentes_model.dart';
import 'package:justificaciones/src/widgets/menu_widget.dart';


class DocentesHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   
    final docentesBloc = Provider.docentesBloc(context);
    docentesBloc.cargarDocentes();


    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Docentes'),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      ),
      body: _crearListado(docentesBloc),
      floatingActionButton: _crearBoton( context ),
    );
  }

  Widget _crearListado(DocentesBloc docentesBloc) {

    return StreamBuilder(
      stream: docentesBloc.docentesStream,
      builder: (BuildContext context, AsyncSnapshot<List<DocentesModel>> snapshot) {
        
        if ( snapshot.hasData ) {

          final docentes = snapshot.data;

          return ListView.builder(
            itemCount: docentes.length,
            itemBuilder: (context, i) => _crearItem(context, docentesBloc, docentes[i] )
          );

        } else {
          return Center( child: CircularProgressIndicator() );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, DocentesBloc docentesBloc, DocentesModel docente) {

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: ( dirreccion ) => docentesBloc.borrarDocente(docente.id),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: 
              Text('${ docente.nombre }'
              '${ docente.asignatura } - ${ docente.turno }'
              '${ docente.contacto }'),
              subtitle: Text( docente.id ),
              onTap: () => Navigator.pushNamed(context, 'docente', arguments: docente ),
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
      onPressed: () => Navigator.pushNamed(context, 'docente'),
    );
  }

}