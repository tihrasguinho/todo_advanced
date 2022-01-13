import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_advanced/features/home/presentation/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
