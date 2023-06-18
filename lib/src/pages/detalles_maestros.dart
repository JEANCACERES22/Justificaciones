import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:justificaciones/src/pages/editdata.dart';
import 'package:justificaciones/src/pages/maestro_home_page.dart';

class DetallesMestros extends StatefulWidget {
  List list;
  int index;
  DetallesMestros({this.index, this.list});
  @override
  _DetallesMestrosState createState() => new _DetallesMestrosState();
}

class _DetallesMestrosState extends State<DetallesMestros> {
  void deleteData() {
    var url = "http://192.168.101.9/justificaciones/eliminar_maestros.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Esta seguto de eliminar '${widget.list[widget.index]['nom_mtro']}'"),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text("OK Eliminado!",
              style: new TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(primary: Colors.red),
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new MaestrosHomePage(),
            ));
          },
        ),
        new ElevatedButton(
          child:
              new Text("CANCELAR", style: new TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(primary: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['nom_mtro']}"),
          backgroundColor: Color.fromRGBO(128, 0, 0, 1.0)),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['nom_mtro'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                Divider(),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ElevatedButton(
                        child: new Text("EDITAR"),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(128, 0, 0, 1.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                        ),
                        onPressed: () => Navigator.of(context).push(
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new EditarAlumno(
                                      list: widget.list,
                                      index: widget.index,
                                    )))),
                    VerticalDivider(),
                    new ElevatedButton(
                        child: new Text("ELIMINAR"),
                        onPressed: () => confirm(),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(128, 0, 0, 1.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
