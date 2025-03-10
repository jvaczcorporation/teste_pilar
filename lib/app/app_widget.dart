import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setObservers([Asuka.asukaHeroController]);

    return MaterialApp.router(
      theme: ThemeData(
        textTheme: GoogleFonts.sourceSans3TextTheme(),
      ),
      title: 'TheMovieDB',
      routerConfig: Modular.routerConfig,
      builder: Asuka.builder,
    );
  }
}
