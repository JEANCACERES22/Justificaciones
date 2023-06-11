import 'dart:convert';

AlumnoModel alumnoModelFromJson(String str) =>
    AlumnoModel.fromJson(json.decode(str));

String alumnoModelToJson(AlumnoModel data) => json.encode(data.toJson());

class AlumnoModel {
  String id;
  String nombre;
  String semestre;
  String grupo;
  String carrera;
  String turno;
  int aula;
  int numcontrol;

  AlumnoModel({
    this.id,
    this.nombre = '',
    this.semestre = '',
    this.grupo = '',
    this.carrera = '',
    this.turno,
    this.aula = 0,
    this.numcontrol = 0
  });

  factory AlumnoModel.fromJson(Map<String, dynamic> json) => new AlumnoModel(
    id        : json["id"],
    nombre    : json["nombre"], 
    semestre  : json["semestre"], 
    grupo     : json["grupo"], 
    carrera   : json["carrera"], 
    turno     : json["turno"], 
    aula      : json["aula"], 
    numcontrol: json["numcontrol"]
  );

  Map<String, dynamic> toJson() => {
    "nombre" : nombre,
    "semestre" : semestre,
    "grupo" : grupo,
    "carrera" : carrera,
    "turno" : turno,
    "aula" : aula,
    "numcontrol": numcontrol
  };

}