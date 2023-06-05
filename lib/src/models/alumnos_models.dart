import 'dart:convert';

AlumnoModel alumnoModelFromJson(String str) =>
    AlumnoModel.fromJson(json.decode(str));

String alumnoModelToJson(AlumnoModel data) => json.encode(data.toJson());

class AlumnoModel {
  String nombre;
  String semestre;
  String grupo;
  String carrera;
  String turno;

  AlumnoModel({
    required this.nombre,
    required this.semestre,
    required this.grupo,
    required this.carrera,
    required this.turno
  });

  factory AlumnoModel.fromJson(Map<String, dynamic> json) => new AlumnoModel(
    nombre: json["nombre"], 
    semestre: json["semestre"], 
    grupo: json["grupo"], 
    carrera: json["carrera"], 
    turno: json["turno"], 
  );

  Map<String, dynamic> toJson() => {
    "nombre" : nombre,
    "semestre" : semestre,
    "grupo" : grupo,
    "carrera" : carrera,
    "turno" : turno
  };

}