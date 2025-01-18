import 'dart:convert';

import 'package:tennis_scoreboard/models/partido_model.dart';
import 'package:http/http.dart';
import 'package:tennis_scoreboard/services/tenis_service.dart';

class PartidosService {
  
  final _url =
      'https://backendtenis-production-f103.up.railway.app/api/v1/partidos';

  Future<List<Partido>> getPartidosPendientes() async {
    Uri uri = Uri.parse('$_url/all');
    Response response = await get(uri);
    final partidosResponse = partidosResponseFromJson(response.body);

    return partidosResponse.data;
  }

  Future putPartidoFinalizado() async {
    Partido partido = TenisService.finalizaPartido();
    Uri uri = Uri.parse('$_url/');

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    print(jsonEncode(partido.toJson()));

    await put(uri, headers: headers, body: jsonEncode(partido.toJson()));
  }
}
