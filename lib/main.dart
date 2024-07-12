import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:teste_pilar/app/app_module.dart';
import 'package:teste_pilar/app/app_widget.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR');

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
