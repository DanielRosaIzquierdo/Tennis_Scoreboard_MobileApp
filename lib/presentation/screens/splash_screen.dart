import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tennis_scoreboard/models/partido_model.dart';
import 'package:tennis_scoreboard/services/partidos_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getMenuItems();
  }

  _getMenuItems() async {
    await Future.delayed(const Duration(seconds: 2));
    PartidosService partidosService = PartidosService();
    List<Partido> partidos = await partidosService.getPartidosPendientes();
    context.pushReplacement('/home', extra: partidos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image',
                height: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              Text('TENNIS SCOREBOARD',
                  style: GoogleFonts.openSans(
                      fontSize: 55, fontWeight: FontWeight.bold))
            ],
          ),
        )));
  }
}
