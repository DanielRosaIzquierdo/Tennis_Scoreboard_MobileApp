// To parse this JSON data, do
//
//     final partidosResponse = partidosResponseFromJson(jsonString);

import 'dart:convert';

PartidosResponse partidosResponseFromJson(String str) => PartidosResponse.fromJson(json.decode(str));

String partidosResponseToJson(PartidosResponse data) => json.encode(data.toJson());

class PartidosResponse {
    String status;
    List<Partido> data;

    PartidosResponse({
        required this.status,
        required this.data,
    });

    factory PartidosResponse.fromJson(Map<String, dynamic> json) => PartidosResponse(
        status: json["status"],
        data: List<Partido>.from(json["data"].map((x) => Partido.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Partido {
    Jugador jugador1;
    Jugador jugador2;
    bool finalizado;
    String resultado;
    String id;

    Partido({
        required this.jugador1,
        required this.jugador2,
        required this.finalizado,
        required this.resultado,
        required this.id,
    });

    factory Partido.fromJson(Map<String, dynamic> json) => Partido(
        jugador1: Jugador.fromJson(json["Jugador1"]),
        jugador2: Jugador.fromJson(json["Jugador2"]),
        finalizado: json["finalizado"],
        resultado: json["resultado"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "Jugador1": jugador1.toJson(),
        "Jugador2": jugador2.toJson(),
        "finalizado": finalizado,
        "resultado": resultado,
        "id": id,
    };
}

class Jugador {
    String img;
    String nombre;

    Jugador({
        required this.img,
        required this.nombre,
    });

    factory Jugador.fromJson(Map<String, dynamic> json) => Jugador(
        img: json["img"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
        "nombre": nombre,
    };
}
