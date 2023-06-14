import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justificaciones/src/pages/home_page.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/CBTIS.jpg"),
            fit: BoxFit.cover,
            opacity: 0.6,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CBTIS 72", style: GoogleFonts.pacifico(
                fontSize: 50, 
                color: Colors.white,
              )),
            Column(
              children: [
                InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => HomePage()
                    ));
                  },
                  child: Ink(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 127, 0, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Empezar", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1),),
                    ),
                  ),
                )
              ],
            ),
            ],
          ),
      ),
    );
  }
}