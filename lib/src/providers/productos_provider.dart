import 'dart:convert';
import 'package:justificaciones/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

import 'package:justificaciones/src/models/producto_model.dart';

class ProductosProvider {
  final String _url =
      'https://justificaciones-8150b-default-rtdb.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = Uri.parse('$_url/alumnos.json?auth=${_prefs.token}');

    final resp = await http.post(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarProducto(ProductoModel producto) async {
    final url =
        Uri.parse('$_url/alumnos/${producto.id}.json?auth=${_prefs.token}');

    final resp = await http.put(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = Uri.parse('$_url/alumnos.json?auth=${_prefs.token}');

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<ProductoModel> productos = [];

    if (decodedData == null) return [];

    if (decodedData['error'] != null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;

      productos.add(prodTemp);
    });

    // print( productos[0].id );

    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = Uri.parse('$_url/alumnos/$id.json?auth=${_prefs.token}');
    final resp = await http.delete(url);

    print(resp.body);

    return 1;
  }


}
