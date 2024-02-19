import 'package:desafio_padawans_flutter/src/screens/personagens/personagens_controller.dart';
import 'package:desafio_padawans_flutter/src/screens/personagens/personagens_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app_screen.dart';

_customInit() {
  // this._configureFirebase();

  GetIt getIt = GetIt.I;
  getIt.registerSingleton(PersonagensController());
  getIt.registerSingleton(PersonagensWidget());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Wakelock.enable();
  _customInit();
  runApp(AppScreen());
}
