import 'package:flutter/material.dart';
import 'package:justificaciones/src/bloc/provider.dart';
import 'package:justificaciones/src/models/producto_model.dart';
import 'package:justificaciones/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();

    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Alumnos'),
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, i) =>
                  _crearItem(context, productosBloc, productos[i]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductosBloc productosBloc,
      ProductoModel producto) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (dirreccion) => productosBloc.borrarProducto(producto.id),
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                    '${producto.nombre} - ${producto.aula} - ${producto.semestre} - ${producto.carrera} - ${producto.numcontrol} - ${producto.grupo}'),
                subtitle: Text(producto.id),
                onTap: () => Navigator.pushNamed(context, 'producto',
                    arguments: producto),
              ),
            ],
          ),
        ));
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }
}
