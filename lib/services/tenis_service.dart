import 'package:tennis_scoreboard/models/partido_model.dart';

class TenisService {
  static String nombreJugador1 = '';
  static String apellidoJugador1 = '';
  static String nombreJugador2 = '';
  static String apellidoJugador2 = '';
  static String imgJugador1 = '';
  static String imgJugador2 = '';
  static String imgPorDefecto =
      'https://cdn-icons-png.flaticon.com/512/9385/9385289.png';
  static int puntosJugador1 = 0;
  static int puntosJugador2 = 0;
  static List<int> juegosJugador1 = [0, 0, 0];
  static List<int> juegosJugador2 = [0, 0, 0];
  static int setsJugador1 = 0;
  static int setsJugador2 = 0;
  static int setActual = 0;
  static bool partidoFinalizado = false;
  static bool saque = true;
  static Partido? partidoData;
  static List<Partido> partidosData = [];
  static int contPartidoActual = 0;
  static bool noHayPartidos = false;

  static void recibePartidos(List<Partido> partidos) {
    partidosData = partidos;
    recibePartido();
  }

  static void recibePartido() {
    if (partidosData.isNotEmpty) {
      Partido partido = partidosData[contPartidoActual];

      partidoFinalizado = false;

      nombreJugador1 = partido.jugador1.nombre
          .substring(0, partido.jugador1.nombre.lastIndexOf(' '));
      nombreJugador2 = partido.jugador2.nombre
          .substring(0, partido.jugador2.nombre.lastIndexOf(' '));

      apellidoJugador1 = partido.jugador1.nombre
          .substring(partido.jugador1.nombre.lastIndexOf(' ') + 1);
      apellidoJugador2 = partido.jugador2.nombre
          .substring(partido.jugador2.nombre.lastIndexOf(' ') + 1);

      
      imgJugador1 =
          (partido.jugador1.img != '') ? partido.jugador1.img : imgPorDefecto;
      imgJugador2 =
          (partido.jugador2.img != '') ? partido.jugador2.img : imgPorDefecto;

      partidoData = partido;
    } else {
      noHayPartidos = true;
    }
  }

  static Partido finalizaPartido() {
    if (contPartidoActual != partidosData.length - 1) {
      contPartidoActual++;
    } else {
      noHayPartidos = true;
    }

    partidoData!.finalizado = true;
    partidoData!.resultado =
        '${juegosJugador1[0]}-${juegosJugador2[0]}, ${juegosJugador1[1]}-${juegosJugador2[1]}, ${juegosJugador1[2]}-${juegosJugador2[2]}';

    puntosJugador1 = 0;
    puntosJugador2 = 0;
    juegosJugador1 = [0, 0, 0];
    juegosJugador2 = [0, 0, 0];
    setsJugador1 = 0;
    setsJugador2 = 0;
    setActual = 0;
    partidoFinalizado = false;
    saque = true;

    return partidoData!;
  }

  static List<String> getPuntos() {
    String puntosJugador1String = devuelvePuntosString(puntosJugador1);
    String puntosJugador2String = devuelvePuntosString(puntosJugador2);

    return [puntosJugador1String, puntosJugador2String];
  }

  static List<String> getJuegos(int numSet) {
    return [
      juegosJugador1[numSet].toString(),
      juegosJugador2[numSet].toString()
    ];
  }

  static List<String> getSets() {
    return [setsJugador1.toString(), setsJugador2.toString()];
  }

  static void sumaPuntos(int jugador) {
    switch (jugador) {
      case 0:
        if (puntosJugador1 == -1) {
          sumaJuegos(jugador);
        } else if (puntosJugador1 == 3 &&
            puntosJugador2 != 3 &&
            puntosJugador2 != -1) {
          sumaJuegos(jugador);
        } else if (puntosJugador1 < 3) {
          puntosJugador1++;
        } else if (puntosJugador2 == 3) {
          puntosJugador1 = -1;
        } else if (puntosJugador2 == -1) {
          puntosJugador1 = 3;
          puntosJugador2 = 3;
        }
        break;
      case 1:
        if (puntosJugador2 == -1) {
          sumaJuegos(jugador);
        } else if (puntosJugador2 == 3 &&
            puntosJugador1 < 3 &&
            puntosJugador1 != -1) {
          sumaJuegos(jugador);
        } else if (puntosJugador2 < 3) {
          puntosJugador2++;
        } else if (puntosJugador1 == 3) {
          puntosJugador2 = -1;
        } else if (puntosJugador1 == -1) {
          puntosJugador2 = 3;
          puntosJugador1 = 3;
        }
        break;
    }
  }

  static void sumaJuegos(int jugador) {
    puntosJugador1 = 0;
    puntosJugador2 = 0;

    switch (jugador) {
      case 0:
        juegosJugador1[setActual]++;

        if (juegosJugador1[setActual] >= 6 &&
            (juegosJugador1[setActual] - juegosJugador2[setActual] > 1)) {
          if (setActual < 2) {
            setActual++;
          } else {
            partidoFinalizado = true;
          }
          setsJugador1++;
          if (setsJugador1 == 2) partidoFinalizado = true;
        }

        break;
      case 1:
        juegosJugador2[setActual]++;
        if (juegosJugador2[setActual] >= 6 &&
            (juegosJugador2[setActual] - juegosJugador1[setActual] > 1)) {
          if (setActual < 2) {
            setActual++;
          } else {
            partidoFinalizado = true;
          }
          setsJugador2++;
          if (setsJugador2 == 2) partidoFinalizado = true;
        }
        break;
    }

    saque = !saque;
  }

  static String devuelvePuntosString(int puntos) {
    switch (puntos) {
      case 0:
        return '0';

      case 1:
        return '15';

      case 2:
        return '30';

      case 3:
        return '40';

      case -1:
        return 'AD';
    }

    return '';
  }
}
