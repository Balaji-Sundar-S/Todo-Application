import 'package:DoNow/core/constants/app.constants.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/core/utils/texts/page_heading.dart';
import 'package:DoNow/features/auth/presentation/widgets/button.dart';
import 'package:DoNow/features/auth/presentation/widgets/textfield.dart';
import 'package:DoNow/features/todo/presentation/logic/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _addTodo() {
    final todoId = DateTime.now().toString();
    final newTodo = Params(
      uid: FirebaseAuth.instance.currentUser?.uid,
      tid: todoId,
      title: _titleController.text,
      description: _descriptionController.text,
    );
    ref.read(todoNotifierProvider.notifier).addTodos(newTodo);
    Navigator.of(context).pop();
    var params = Params(uid: '${FirebaseAuth.instance.currentUser?.uid}');
    Future.microtask(
      () => ref.refresh(todoNotifierProvider.notifier).loadTodos(params),
    );
  }

  _AddTodoState();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const PageHeading(text: AppConstants.addTodo),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(32),
            children: [
              const SizedBox(height: 30.0),
              AppTextfield(
                controller: _titleController,
                obscure: false,
                text: AppConstants.ett,
              ),
              const SizedBox(height: 30.0),
              AppTextfield(
                controller: _descriptionController,
                obscure: false,
                text: AppConstants.etd,
              ),
              const SizedBox(height: 30.0),
              AppButton(
                onpressed: _addTodo,
                text: AppConstants.addTodo,
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
