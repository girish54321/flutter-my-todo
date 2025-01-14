import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:reqres_app/App/CreateTodo/CreateTodoScreenUI.dart';
import 'package:reqres_app/App/FileHelper/imagePicker.dart';
import 'package:reqres_app/state/userTodoState.dart';

enum TodoStateEnum {
  pending,
  inProgress,
  completed,
}

extension TodoStatExtension on TodoStateEnum {
  String get name {
    switch (this) {
      case TodoStateEnum.pending:
        return 'pending';
      case TodoStateEnum.completed:
        return 'completed';
      case TodoStateEnum.inProgress:
        return 'in-progress';
    }
  }
}

class CreateTodoScreen extends StatefulWidget {
  final bool isUpdate;
  const CreateTodoScreen({Key? key, required this.isUpdate}) : super(key: key);

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final UserTodoController userTodoController = Get.find();
  CroppedFile? croppedFile;
  File? localFile;
  TodoStateEnum todoStateEnum = TodoStateEnum.pending;

  void updateTodo() {
    if (_formKey.currentState!.validate()) {
      var parameter = {
        "toDoId": userTodoController.selectedTodo.value?.toDoId ?? 0,
        "title": titleController.text,
        "body": bodyController.text,
        "state": todoStateEnum.name
      };
      userTodoController.updateSelectedTodo(parameter);
    }
  }

  void createNewTodo() {
    if (widget.isUpdate) {
      updateTodo();
      return;
    }
    if (_formKey.currentState!.validate()) {
      var parameter = {
        "title": titleController.text,
        "body": bodyController.text,
        "state": todoStateEnum.name
      };
      userTodoController.createTodo(parameter, localFile);
    }
  }

  void autoFill() {
    if (widget.isUpdate == true) {
      titleController.text = userTodoController.selectedTodo.value?.title ?? "";
      bodyController.text = userTodoController.selectedTodo.value?.body ?? "";
      todoStateEnum = TodoStateEnum.values.firstWhere(
        (item) => item.name == userTodoController.selectedTodo.value?.state,
      );
    }
  }

  Future<void> pickImage() async {
    var file = await Imagepicker().imagePicker();
    if (file != null) {
      setState(() {
        localFile = file;
      });
    }
  }

  void updateSelectedTodo(Set<TodoStateEnum> newSelection) {
    setState(() {
      todoStateEnum = newSelection.first;
    });
  }

  @override
  void initState() {
    autoFill();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isUpdate = widget.isUpdate;
    return CreateTodoScreenUI(
      formKey: _formKey,
      titleController: titleController,
      bodyController: bodyController,
      isUpdate: isUpdate,
      localFile: localFile,
      todoStateEnum: todoStateEnum,
      pickImage: pickImage,
      updateSelectedTodo: updateSelectedTodo,
      createNewTodo: createNewTodo,
    );
  }
}
