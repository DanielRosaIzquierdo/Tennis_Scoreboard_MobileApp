import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tennis_scoreboard/config/router/router_config.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routerConfig: appRouter);
  }
}
