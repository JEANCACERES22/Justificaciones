import 'dart:convert';

DocentesModel docenteModelFromJson(String str) =>
    DocentesModel.fromJson(json.decode(str));

String docenteModelToJson(DocentesModel data) => json.encode(data.toJson());

class DocentesModel {
  String id;
  String nombre;
  String asignatura;
  String contacto;
  String turno;

  DocentesModel({
    this.id,
    this.nombre = '',
    this.asignatura = '',
    this.contacto = '',
    this.turno
  });

  factory DocentesModel.fromJson(Map<String, dynamic> json) => new DocentesModel(
    id: json["id"],
    nombre: json["nombre"], 
    asignatura: json["asignatura"], 
    contacto: json["contacto"], 
    turno: json["turno"], 
  );

  Map<String, dynamic> toJson() => {
    "nombre" : nombre,
    "asignatura" : asignatura,
    "contacto" : contacto,
    "turno" : turno
  };

}