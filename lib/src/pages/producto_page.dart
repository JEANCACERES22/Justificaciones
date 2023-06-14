import 'dart:io';

import 'package:flutter/material.dart';
import 'package:justificaciones/src/bloc/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:justificaciones/src/models/producto_model.dart';
import 'package:justificaciones/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  State<ProductoPage> createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ProductosBloc productosBloc;
  ProductoModel producto = new ProductoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {
    productosBloc = Provider.productosBloc(context);

    final prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      producto = prodData as ProductoModel;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Registro Alumno'),
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
                  _crearAula(),
                  _crearNumControl(),
                  _crearGrupo(),
                  _crearSemestre(),
                  _crearCarrera(),
                  _crearBoton()
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => producto.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa el nombre del alumno';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearAula() {
    return TextFormField(
      initialValue: producto.aula.toString(),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: 'Aula'),
      onSaved: (value) => producto.aula = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Sólo números';
        }
      },
    );
  }

  Widget _crearNumControl() {
    return TextFormField(
      initialValue: producto.numcontrol.toString(),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: 'Numero de control'),
      onSaved: (value) => producto.numcontrol = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Sólo números';
        }
      },
    );
  }

  Widget _crearSemestre() {
    return TextFormField(
      initialValue: producto.semestre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Semestre'),
      onSaved: (value) => producto.semestre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa el semestre';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearGrupo() {
    return TextFormField(
      initialValue: producto.grupo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Grupo'),
      onSaved: (value) => producto.grupo = value,
      validator: (value) {
        if (value.length < 2) {
          return 'Ingresa el grupo';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearCarrera() {
    return TextFormField(
      initialValue: producto.carrera,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Carrera'),
      onSaved: (value) => producto.carrera = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa la carrera';
        } else {
          return null;
        }
      },
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
      _guardando = true;
    });

    if (producto.id == null) {
      productosBloc.agregarProducto(producto);
    } else {
      productosBloc.editarProducto(producto);
    }

    // setState(() {_guardando = false;});
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
