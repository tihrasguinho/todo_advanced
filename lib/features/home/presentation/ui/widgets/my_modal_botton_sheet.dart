import 'package:flutter/material.dart';
import 'package:todo_advanced/features/home/presentation/controller/home_controller.dart';

class MyModalBottonSheet extends StatelessWidget {
  const MyModalBottonSheet({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        const Text('Add your new todo!'),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: controller.titleCtrl,
            decoration: const InputDecoration(
              hintText: 'todo title...',
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: controller.subtitleCtrl,
            decoration: const InputDecoration(
              hintText: 'todo subtitle...',
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: MaterialButton(
            onPressed: () => controller.addTodo(
              title: controller.titleCtrl.text,
              subtitle: controller.subtitleCtrl.text,
            ),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            child: const SizedBox(height: 52, child: Center(child: Text('Add'))),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
