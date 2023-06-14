// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {

    String id;
    String nombre;
    String semestre;
    String grupo;
    int aula;
    int numcontrol;
    String carrera;

    ProductoModel({
        this.id,
        this.nombre = '',
        this.semestre = '',
        this.grupo = '',
        this.aula  = 0,
        this.numcontrol  = 0,
        this.carrera = ''

    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => new ProductoModel(
        id         : json["id"],
        nombre     : json["nombre"],
        semestre      : json["semestre"],
        grupo : json["grupo"],
        aula   : json["aula"],
        numcontrol   : json["numcontrol"],
        carrera   : json["carrera"],
    );

    Map<String, dynamic> toJson() => {
        // "id"         : id,
        "nombre"     : nombre,
        "semestre"      : semestre,
        "grupo" : grupo,
        "aula"    : aula,
        "numcontrol" : numcontrol,
        "carrera "    : carrera ,
    };
}