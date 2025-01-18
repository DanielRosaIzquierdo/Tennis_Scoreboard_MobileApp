import 'package:go_router/go_router.dart';
import 'package:tennis_scoreboard/models/partido_model.dart';
import 'package:tennis_scoreboard/presentation/screens/home_screen.dart';
import 'package:tennis_scoreboard/presentation/screens/splash_screen.dart';
import 'package:tennis_scoreboard/services/tenis_service.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) {
      List<Partido> partidos = state.extra as List<Partido>;
      TenisService.recibePartidos(partidos);
      return const HomeScreen();
    },
  ),
]);
