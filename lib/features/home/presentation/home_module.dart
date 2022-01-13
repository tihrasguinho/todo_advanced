import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_advanced/features/home/data/datasources/change_todo_status_datasource.dart';
import 'package:todo_advanced/features/home/data/datasources/create_todo_datasource.dart';
import 'package:todo_advanced/features/home/data/datasources/delete_todo_datasource.dart';
import 'package:todo_advanced/features/home/data/datasources/fetch_todos_datasource.dart';
import 'package:todo_advanced/features/home/data/datasources/local/change_todo_status_local_datasource_imp.dart';
import 'package:todo_advanced/features/home/data/datasources/local/create_todo_local_datasource_imp.dart';
import 'package:todo_advanced/features/home/data/datasources/local/delete_todo_local_datasource_imp.dart';
import 'package:todo_advanced/features/home/data/datasources/local/fetch_todos_local_repository_imp.dart';
import 'package:todo_advanced/features/home/data/repositories/change_todo_status_repository_imp.dart';
import 'package:todo_advanced/features/home/data/repositories/create_todo_repository_imp.dart';
import 'package:todo_advanced/features/home/data/repositories/delete_todo_repository_imp.dart';
import 'package:todo_advanced/features/home/data/repositories/fetch_todos_repository_imp.dart';
import 'package:todo_advanced/features/home/domain/repositories/change_todo_status_repository.dart';
import 'package:todo_advanced/features/home/domain/repositories/create_todo_repository.dart';
import 'package:todo_advanced/features/home/domain/repositories/delete_todo_repository.dart';
import 'package:todo_advanced/features/home/domain/repositories/fetch_todos_repository.dart';
import 'package:todo_advanced/features/home/domain/usecases/change_todo_status_usecase/change_todo_status_usecase.dart';
import 'package:todo_advanced/features/home/domain/usecases/change_todo_status_usecase/change_todo_status_usecase_imp.dart';
import 'package:todo_advanced/features/home/domain/usecases/create_todo_usecase/create_todo_usecase.dart';
import 'package:todo_advanced/features/home/domain/usecases/create_todo_usecase/create_todo_usecase_imp.dart';
import 'package:todo_advanced/features/home/domain/usecases/delete_todo_usecase/delete_todo_usecase.dart';
import 'package:todo_advanced/features/home/domain/usecases/delete_todo_usecase/delete_todo_usecase_imp.dart';
import 'package:todo_advanced/features/home/domain/usecases/fetch_todos_usecase/fetch_todos_usecase.dart';
import 'package:todo_advanced/features/home/domain/usecases/fetch_todos_usecase/fetch_todos_usecase_imp.dart';
import 'package:todo_advanced/features/home/presentation/controller/home_controller.dart';
import 'package:todo_advanced/features/home/presentation/stores/todos_store.dart';
import 'package:todo_advanced/features/home/presentation/ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        // Datasources
        Bind.lazySingleton<FetchTodosDatasource>((i) => FetchTodosLocalDatasourceImp()),
        Bind.lazySingleton<CreateTodoDatasource>((i) => CreateTodoLocalDatasourceImp()),
        Bind.lazySingleton<ChangeTodoStatusDatasource>((i) => ChangeTodoStatusLocalDatasourceImp()),
        Bind.lazySingleton<DeleteTodoDatasource>((i) => DeleteTodoLocalDatasourceImp()),

        // Repositories
        Bind.lazySingleton<FetchTodosRepository>((i) => FetchTodosRepositoryImp(i())),
        Bind.lazySingleton<CreateTodoRepository>((i) => CreateTodoRepositoryImp(i())),
        Bind.lazySingleton<ChangeTodoStatusRepository>((i) => ChangeTodoStatusRepositoryImp(i())),
        Bind.lazySingleton<DeleteTodoRepository>((i) => DeleteTodoRepositoryImp(i())),

        // Usecases

        Bind.lazySingleton<FetchTodosUsecase>((i) => FetchTodosUsecaseImp(i())),
        Bind.lazySingleton<CreateTodoUseCase>((i) => CreateTodoUseCaseImp(i())),
        Bind.lazySingleton<ChangeTodoStatusUseCase>((i) => ChangeTodoStatusUseCaseImp(i())),
        Bind.lazySingleton<DeleteTodoUseCase>((i) => DeleteTodoUseCaseImp(i())),

        // Stores
        Bind.lazySingleton<TodosStore>((i) => TodosStore(i(), i(), i(), i())),

        // Controllers
        Bind.lazySingleton<HomeController>((i) => HomeController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ];
}
