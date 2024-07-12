import 'package:DoNow/core/constants/app.constants.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/core/styles/color.style.dart';
import 'package:DoNow/core/utils/texts/page_heading.dart';
import 'package:DoNow/features/todo/presentation/logic/provider.dart';
import 'package:DoNow/features/todo/presentation/pages/add.todo.dart';
import 'package:DoNow/features/todo/presentation/pages/settings.page.dart';
import 'package:DoNow/features/todo/presentation/pages/update.todo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  String? todoId;
  @override
  void initState() {
    var params = Params(uid: '${FirebaseAuth.instance.currentUser?.uid}');
    Future.microtask(
        () => ref.refresh(todoNotifierProvider.notifier).loadTodos(params));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoState = ref.watch(todoNotifierProvider);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AddTodo()));
          },
          child: const Icon(
            Icons.add,
            size: 36.0,
          ),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              PageHeading(
                text:
                    '${AppConstants.hello} ${FirebaseAuth.instance.currentUser?.displayName}',
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SettingsPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
                color: AppColors.textfieldText,
                size: 30.0,
              ),
            ),
          ],
        ),
        body: todoState.maybeWhen(
          orElse: () => const Center(child: CircularProgressIndicator()),
          initial: () => const Center(child: Text(AppConstants.sat)),
          data: (todos) => todos == null || todos.isEmpty
              ? const Center(child: Text(AppConstants.sat))
              : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text('${todo.title}'),
                      subtitle: Text('${todo.description}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const CircleAvatar(child: Icon(Icons.edit)),
                            onPressed: () async {
                              final titleController =
                                  TextEditingController(text: todo.title);
                              final descriptionController =
                                  TextEditingController(text: todo.description);
                              String todoIden = todo.tid.toString();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => UpdateTodo(
                                    titleController: titleController,
                                    descriptionController:
                                        descriptionController,
                                    todoId: todoIden,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const CircleAvatar(child: Icon(Icons.delete)),
                            onPressed: () {
                              var params = Params(
                                  uid: FirebaseAuth.instance.currentUser?.uid,
                                  tid: todo.tid);
                              ref
                                  .read(todoNotifierProvider.notifier)
                                  .deleteTodos(params);
                              var dparams = Params(
                                uid:
                                    '${FirebaseAuth.instance.currentUser?.uid}',
                              );
                              Future.microtask(() => ref
                                  .refresh(todoNotifierProvider.notifier)
                                  .loadTodos(dparams));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
          error: (msg) => Center(child: Text('Error: $msg')),
        ),
      ),
    );
  }
}
