import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:justificaciones/src/pages/home.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  Future login() async {
    var url = "http://192.168.101.9/justificaciones/login.php";
    final response = await http.post(url, body: {
      "username": controllerUser.text,
      "password": controllerPass.text,
    });
    final data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: 'Login exitoso',
          fontSize: 10, 
          textColor: Colors.green,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(),),);
    } else {
      Fluttertoast.showToast(
          msg: 'Username y password inválidos',
          fontSize: 10, 
          textColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 0.5),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 60.0),
                _crearEmail(),
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 30.0),
                _crearBoton()
              ],
            ),
          ),
          TextButton(
            child: Text('Crear una nueva cuenta'),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
          ),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.alternate_email,
                      color: Color.fromRGBO(128, 0, 0, 1.0)),
                  hintText: 'ejemplo@correo.com',
                  labelText: 'Correo electrónico',
              ),
              controller: controllerUser,
            ),
          );
        });
  }

  Widget _crearPassword() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline,
                      color: Color.fromRGBO(128, 0, 0, 1.0)),
                  labelText: 'Contraseña',
                  counterText: snapshot.data,
                ),
                controller: controllerPass,
            ),
          );
        });
  }

  Widget _crearBoton() {

    
          return ElevatedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                child: Text('Ingresar'),
              ),
              onPressed: () {
                login();
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  textStyle: TextStyle(color: Colors.white),
                  primary: Color.fromRGBO(128, 0, 0, 1.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))));
                      
        
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(128, 0, 0, 1.0),
        Color.fromRGBO(128, 0, 0, 0.8)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              SizedBox( height: 10.0, width: double.infinity),
              Text('CBTis 72', style: TextStyle( color: Colors.white, fontSize: 25.0)),
              Text('Andrés Quintana Roo', style: TextStyle( color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }
}
