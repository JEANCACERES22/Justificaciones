import 'package:flutter/material.dart';
import 'package:justificaciones/src/bloc/alumnos_bloc.dart';
import 'package:justificaciones/src/bloc/docentes_bloc.dart';
import 'package:justificaciones/src/bloc/login_bloc.dart';
// import 'package:justificaciones/src/bloc/login_bloc.dart';


class Provider extends InheritedWidget {

  final loginBloc = new LoginBloc();
  final _alumnosBloc = new AlumnosBloc();
  final _docentesBloc = new DocentesBloc();

  static Provider _instancia;

  factory Provider({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new Provider._internal(key: key, child: child );
    }

    return _instancia as Provider;

  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child );


  

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ) {
    return ( context.dependOnInheritedWidgetOfExactType<Provider>() ).loginBloc;
  }

  static AlumnosBloc alumnosBloc ( BuildContext context ) {
    return ( context.dependOnInheritedWidgetOfExactType<Provider>() )._alumnosBloc;
  }

  static DocentesBloc docentesBloc ( BuildContext context ) {
    return ( context.dependOnInheritedWidgetOfExactType<Provider>() )._docentesBloc;
  } 

}