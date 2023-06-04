import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/Login_page.dart';

class newMail extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(128, 0, 0, 1.0),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CBTIS72',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'ANDRES QUINTANA ROO',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(35.0),
                child: Container(
                  padding: EdgeInsets.all(35.0),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3.2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Text(
                        'Crear Cuenta',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Correo electronico',
                          icon: Icon(Icons.alternate_email),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          icon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      SizedBox(height: 24.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(128, 0, 0, 1.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text('Iniciar'),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: TextButton(
                          child: Text('Ya tienes cuenta? Login'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
