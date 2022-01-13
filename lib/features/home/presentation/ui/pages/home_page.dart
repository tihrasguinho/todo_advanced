import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_advanced/features/home/presentation/controller/home_controller.dart';
import 'package:todo_advanced/features/home/presentation/states/todos_state.dart';
import 'package:todo_advanced/features/home/presentation/stores/todos_store.dart';
import 'package:todo_advanced/features/home/presentation/ui/widgets/my_modal_botton_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodosStore store = Modular.get();
  HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet(
          context: context,
          enableDrag: true,
          isScrollControlled: true,
          builder: (context) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: MyModalBottonSheet(controller: controller),
          ),
        ),
        label: const Text('Add New Todo'),
        icon: const Icon(Icons.add_rounded),
      ),
      body: ValueListenableBuilder<TodosState>(
        valueListenable: store,
        builder: (context, state, child) {
          if (state is LoadingTodosState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorTodosState) {
            return Center(child: Text(state.error));
          } else {
            state as SuccessTodosState;

            return state.todos.isEmpty
                ? const Center(child: Text('You don\'t have any todo registered'))
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: state.todos.length,
                    itemBuilder: (context, i) {
                      final item = state.todos[i];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: InkWell(
                          onTap: () => controller.changeStatus(item.id),
                          onLongPress: () => controller.deleteTodo(item.id),
                          borderRadius: BorderRadius.circular(8),
                          splashColor: Colors.black12,
                          highlightColor: Colors.black12,
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: item.done ? Colors.green : Colors.red,
                                  blurRadius: 4,
                                  offset: const Offset(1, 1),
                                  blurStyle: BlurStyle.solid,
                                ),
                                BoxShadow(
                                  color: item.done ? Colors.green : Colors.red,
                                  blurRadius: 4,
                                  offset: const Offset(-1, -1),
                                  blurStyle: BlurStyle.solid,
                                ),
                              ],
                            ),
                            height: 64,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              fontSize: 16,
                                              color: item.done ? Colors.green : Colors.red,
                                            ),
                                      ),
                                      Text(
                                        item.subtitle,
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 14,
                                              color: item.done ? Colors.green.shade300 : Colors.red.shade300,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 64,
                                  child: Icon(
                                    item.done ? Icons.check_rounded : Icons.clear_rounded,
                                    color: item.done ? Colors.green : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
