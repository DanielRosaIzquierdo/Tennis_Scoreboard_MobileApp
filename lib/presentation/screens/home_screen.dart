import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tennis_scoreboard/services/partidos_service.dart';
import 'package:tennis_scoreboard/services/tenis_service.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.7,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            color: Colors.white,
                            width: double.infinity,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Torneo IES FERNANDO III',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 10, 19, 39),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 10, 19, 39),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: (TenisService.saque)
                                              ? Colors.amber
                                              : const Color.fromARGB(
                                                  255, 10, 19, 39),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                          radius: 65,
                                          backgroundImage: (TenisService
                                                      .imgJugador1 ==
                                                  '')
                                              ? NetworkImage(
                                                  TenisService.imgPorDefecto)
                                              : NetworkImage(
                                                  TenisService.imgJugador1)),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: TenisService.nombreJugador1,
                                        style: const TextStyle(fontSize: 60)),
                                    const TextSpan(text: '\n'),
                                    TextSpan(
                                        text: TenisService.apellidoJugador1
                                            .toUpperCase(),
                                        style: const TextStyle(fontSize: 70)),
                                  ])),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 10, 19, 39),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: (TenisService.saque)
                                              ? const Color.fromARGB(
                                                  255, 10, 19, 39)
                                              : Colors.amber,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100))),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CircleAvatar(
                                            radius: 65,
                                            backgroundImage: (TenisService
                                                        .imgJugador1 ==
                                                    '')
                                                ? NetworkImage(
                                                    TenisService.imgPorDefecto)
                                                : NetworkImage(
                                                    TenisService.imgJugador2)),
                                      )),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: TenisService.nombreJugador2,
                                        style: const TextStyle(fontSize: 60)),
                                    const TextSpan(text: '\n'),
                                    TextSpan(
                                        text: TenisService.apellidoJugador2
                                            .toUpperCase(),
                                        style: const TextStyle(fontSize: 70)),
                                  ])),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            color: Colors.white,
                            width: double.infinity,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'JUEGOS',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 10, 19, 39),
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                              height: 150,
                              width: double.infinity,
                              color: const Color.fromARGB(255, 10, 19, 39),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    TenisService.getJuegos(0)[0],
                                    style: TextStyle(
                                        fontSize: 90,
                                        color: (int.parse(
                                                    TenisService.getJuegos(
                                                        0)[0]) <
                                                int.parse(
                                                    TenisService.getJuegos(
                                                        0)[1]))
                                            ? Colors.grey
                                            : Colors.white),
                                  ),
                                  Text(
                                    TenisService.getJuegos(1)[0],
                                    style: TextStyle(
                                        fontSize: 90,
                                        color: (int.parse(
                                                    TenisService.getJuegos(
                                                        1)[0]) <
                                                int.parse(
                                                    TenisService.getJuegos(
                                                        1)[1]))
                                            ? Colors.grey
                                            : Colors.white),
                                  ),
                                  Text(
                                    TenisService.getJuegos(2)[0],
                                    style: TextStyle(
                                        fontSize: 90,
                                        color: (int.parse(
                                                    TenisService.getJuegos(
                                                        2)[0]) <
                                                int.parse(
                                                    TenisService.getJuegos(
                                                        2)[1]))
                                            ? Colors.grey
                                            : Colors.white),
                                  ),
                                ],
                              )),
                          Container(
                              height: 150,
                              width: double.infinity,
                              color: const Color.fromARGB(255, 10, 19, 39),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    TenisService.getJuegos(0)[1],
                                    style: TextStyle(
                                        fontSize: 90,
                                        color: (int.parse(
                                                    TenisService.getJuegos(
                                                        0)[1]) <
                                                int.parse(
                                                    TenisService.getJuegos(
                                                        0)[0]))
                                            ? Colors.grey
                                            : Colors.white),
                                  ),
                                  Text(
                                    TenisService.getJuegos(1)[1],
                                    style: TextStyle(
                                        fontSize: 90,
                                        color: (int.parse(
                                                    TenisService.getJuegos(
                                                        1)[1]) <
                                                int.parse(
                                                    TenisService.getJuegos(
                                                        1)[0]))
                                            ? Colors.grey
                                            : Colors.white),
                                  ),
                                  Text(
                                    TenisService.getJuegos(2)[1],
                                    style: TextStyle(
                                        fontSize: 90,
                                        color: (int.parse(
                                                    TenisService.getJuegos(
                                                        2)[1]) <
                                                int.parse(
                                                    TenisService.getJuegos(
                                                        2)[0]))
                                            ? Colors.grey
                                            : Colors.white),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 50,
                              color: Colors.white,
                              width: double.infinity,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'PUNTOS',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 10, 19, 39),
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              height: 150,
                              width: double.infinity,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  TenisService.getPuntos()[0],
                                  style: const TextStyle(
                                      fontSize: 90,
                                      color: Color.fromARGB(255, 10, 19, 39)),
                                ),
                              ),
                            ),
                            Container(
                              height: 150,
                              width: double.infinity,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  TenisService.getPuntos()[1],
                                  style: const TextStyle(
                                      fontSize: 90,
                                      color: Color.fromARGB(255, 10, 19, 39)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          height: 150,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: IconButton.filledTonal(
                                iconSize: 90,
                                onPressed: (TenisService.partidoFinalizado)
                                    ? null
                                    : () {
                                        TenisService.sumaPuntos(0);

                                        setState(() {});
                                      },
                                icon: const Icon(
                                  Icons.add,
                                )),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          height: 150,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: IconButton.filledTonal(
                                iconSize: 90,
                                onPressed: (TenisService.partidoFinalizado)
                                    ? null
                                    : () {
                                        TenisService.sumaPuntos(1);
                                        setState(() {});
                                      },
                                icon: const Icon(
                                  Icons.add,
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            (TenisService.partidosData.isEmpty || TenisService.noHayPartidos)
                ? Padding(
                    padding: const EdgeInsets.only(left: 500),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.red,
                        height: 100,
                        width: 330,
                        child: const Center(
                          child: Text(
                            'No hay más partidos por jugar',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: DataTable(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  headingRowColor: WidgetStateProperty.all(Colors.white),
                  dataRowColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 10, 19, 39)),
                  columns: const [
                    DataColumn(
                      label: Text(
                        'JUGADOR',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 10, 19, 39)),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'SETS',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 10, 19, 39)),
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(
                        Text(
                          TenisService.apellidoJugador1.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            TenisService.getSets()[0],
                            style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text(
                          TenisService.apellidoJugador2.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            TenisService.getSets()[1],
                            style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: SizedBox(
          height: 110,
          width: 320,
          child: FloatingActionButton.extended(
            onPressed: () async {
              if (TenisService.noHayPartidos) {
                Fluttertoast.showToast(
                    msg: "No hay más partidos",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color.fromARGB(255, 10, 19, 39),
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                bool finalizar = false;

                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  finalizar = true;
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Sí',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 19, 39),
                                  ),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 19, 39),
                                  ),
                                )),
                          ],
                          title: const Text('¿Estás seguro?'),
                          content: const Text(
                              'Se registrará este partido y aparecerá el próximo'),
                        ));

                if (finalizar) {
                  PartidosService partidosService = PartidosService();
                  await partidosService.putPartidoFinalizado();

                  Fluttertoast.showToast(
                      msg:
                          "Partido finalizado, ha sido registrado en la base de datos",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: const Color.fromARGB(255, 10, 19, 39),
                      textColor: Colors.white,
                      fontSize: 16.0);

                  TenisService.recibePartido();
                  setState(() {});
                }
              }
            },
            icon: const Icon(
              Icons.flag,
              size: 40,
            ),
            label: const Text(
              'Finalizar partido',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
