// ignore_for_file: must_be_immutable

import 'package:DoNow/core/constants/app.constants.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/core/utils/texts/page_heading.dart';
import 'package:DoNow/features/auth/presentation/widgets/button.dart';
import 'package:DoNow/features/auth/presentation/widgets/textfield.dart';
import 'package:DoNow/features/todo/presentation/logic/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateTodo extends ConsumerStatefulWidget {
  TextEditingController titleController;
  TextEditingController descriptionController;
  String todoId;
  UpdateTodo({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.todoId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends ConsumerState<UpdateTodo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _updateTodo() {
    final updatedTodo = Params(
      uid: FirebaseAuth.instance.currentUser?.uid,
      tid: widget.todoId,
      title: widget.titleController.text,
      description: widget.descriptionController.text,
    );
    ref.read(todoNotifierProvider.notifier).updateTodos(updatedTodo);
    var params = Params(
      uid: '${FirebaseAuth.instance.currentUser?.uid}',
    );
    Future.microtask(
        () => ref.refresh(todoNotifierProvider.notifier).loadTodos(params));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const PageHeading(text: AppConstants.updateTodo),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(32),
            children: [
              const SizedBox(height: 30.0),
              AppTextfield(controller: widget.titleController, obscure: false),
              const SizedBox(height: 30.0),
              AppTextfield(
                  controller: widget.descriptionController, obscure: false),
              const SizedBox(height: 30.0),
              AppButton(
                onpressed: _updateTodo,
                text: AppConstants.updateTodo,
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
