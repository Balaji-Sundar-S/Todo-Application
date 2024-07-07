import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/core/params/params.dart';
import 'package:todo_application/features/auth/presentation/logic/auth.provider.dart';
import 'package:todo_application/features/auth/presentation/pages/login.page.dart';
import 'package:todo_application/features/todo/presentation/logic/provider.dart';
import 'package:todo_application/features/todo/presentation/pages/welcome.page.dart';
import 'package:uuid/uuid.dart';

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
          onPressed: () async {
            final addtitleController = TextEditingController();
            final adddescriptionController = TextEditingController();

            await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Add Todo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: addtitleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: adddescriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      const uuid = Uuid(); // Generate a unique ID
                      final todoId = uuid.v4();
                      final newTodo = Params(
                        uid: FirebaseAuth.instance.currentUser?.uid,
                        tid: todoId,
                        title: addtitleController.text,
                        description: adddescriptionController.text,
                      );
                      ref.read(todoNotifierProvider.notifier).addTodos(newTodo);
                      Navigator.of(context).pop();
                      var params = Params(
                          uid: '${FirebaseAuth.instance.currentUser?.uid}');
                      Future.microtask(() => ref
                          .refresh(todoNotifierProvider.notifier)
                          .loadTodos(params));
                    },
                    child: const Text('Add'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(
                Icons.person,
                size: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello!',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text('${FirebaseAuth.instance.currentUser?.displayName}')
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  final authNotifier = ref.read(authStateProvider.notifier);
                  await authNotifier.signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const WelcomePage(),
                    ),
                  );
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: todoState.maybeWhen(
          // empty: () => const Center(child: Text('')),
          orElse: () => const Center(child: CircularProgressIndicator()),
          initial: () => const Center(child: Text('Start adding todos!')),
          data: (todos) => todos == null || todos.isEmpty
              ? const Center(child: Text('Start adding todos!'))
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
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              final titleController =
                                  TextEditingController(text: todo.title);
                              final descriptionController =
                                  TextEditingController(text: todo.description);
                              String todoIden = todo.tid.toString();
                              await showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Update Todo'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: titleController,
                                        decoration: const InputDecoration(
                                            labelText: 'Title'),
                                      ),
                                      TextField(
                                        controller: descriptionController,
                                        decoration: const InputDecoration(
                                            labelText: 'Description'),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        final updatedTodo = Params(
                                          uid: FirebaseAuth
                                              .instance.currentUser?.uid,
                                          tid: todoIden,
                                          title: titleController.text,
                                          description:
                                              descriptionController.text,
                                        );
                                        ref
                                            .read(todoNotifierProvider.notifier)
                                            .updateTodos(updatedTodo);
                                        var params = Params(
                                          uid:
                                              '${FirebaseAuth.instance.currentUser?.uid}',
                                        );
                                        Future.microtask(() => ref
                                            .refresh(
                                                todoNotifierProvider.notifier)
                                            .loadTodos(params));
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Update'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
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
