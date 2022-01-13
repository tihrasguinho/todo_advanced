import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo Advanced',
      builder: asuka.builder,
      navigatorObservers: [asuka.asukaHeroController],
      theme: FlexThemeData.light(scheme: FlexScheme.sanJuanBlue),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.sanJuanBlue),
    ).modular();
  }
}
