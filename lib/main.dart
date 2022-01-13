import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_advanced/app_module.dart';
import 'package:todo_advanced/app_widget.dart';
import 'package:todo_advanced/core/hive/config/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveConfig.init();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
