import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  List<String> informationList = [];

  void _addInformation(String information) {
    setState(() {
      informationList.add(information);
    });
  }

  List<Item> items = [
    Item(
      nombre: 'Juan Perez',
      semestre: 'tercer semestre',
      grupo: 'A',
      carrera: 'Ingeniería',
      turno: 'Matutino',
      fechaInicio: '01/06/2023',
      fechaFinal: '30/06/2023',
      opcionSeleccionada: 'Opción 1',
    ),
    Item(
      nombre: 'Maria Lopez',
      semestre: '3cer semestre',
      grupo: 'B',
      carrera: 'Licenciatura',
      turno: 'Vespertino',
      fechaInicio: '01/06/2023',
      fechaFinal: '30/06/2023',
      opcionSeleccionada: 'Opción 2',
    ),
  ];

  List<Item> filteredItems = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
        title: Text('Registro de justificaciones'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    filteredItems = items
                        .where((item) => item.nombre
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Buscar',
                  border: OutlineInputBorder(),
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                Item item = filteredItems[index];
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Card(
                    child: ExpansionTile(
                      title: Text(item.nombre),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Semestre: ${item.semestre}'),
                          Text('Grupo: ${item.grupo}'),
                          Text('Carrera: ${item.carrera}'),
                          Text('Turno: ${item.turno}'),
                          Text('Fecha de inicio: ${item.fechaInicio}'),
                          Text('Fecha de final: ${item.fechaFinal}'),
                        ],
                      ),
                      children: [
                        ListTile(
                          title: Text('cuestion Familiar '),
                          onTap: () {
                            setState(() {
                              print(
                                  '${item.nombre} de ${item.semestre} de la carrera de ${item.carrera} tuvo jutificacion por cuestion Familiar');
                            });
                          },
                        ),
                        ListTile(
                          title: Text('Enfermedad'),
                          onTap: () {
                            setState(() {
                              print(
                                  ' ${item.nombre} de ${item.semestre} de la carrera de ${item.carrera} tuvo jutificacion por Enfermedad');
                            });
                          },
                        ),
                        ListTile(
                          title: Text('otros'),
                          onTap: () {
                            setState(() {
                              print(
                                  ' ${item.nombre} de ${item.semestre} de la carrera de ${item.carrera} tuvo jutificacion por otro motivo');
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  String nombre;
  String semestre;
  String grupo;
  String carrera;
  String turno;
  String fechaInicio;
  String fechaFinal;
  String opcionSeleccionada;

  Item({
    this.nombre,
    this.semestre,
    this.grupo,
    this.carrera,
    this.turno,
    this.fechaInicio,
    this.fechaFinal,
    this.opcionSeleccionada,
  });
}
