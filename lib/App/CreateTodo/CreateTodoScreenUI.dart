import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:reqres_app/App/CreateTodo/CreateTodoScreen.dart';
import 'package:reqres_app/widget/appInputText.dart';
import 'package:reqres_app/widget/appText.dart';
import 'package:reqres_app/widget/buttons.dart';
import 'package:rules/rules.dart';

class CreateTodoScreenUI extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function()? pickImage;
  final Function() createNewTodo;
  final Function(Set<TodoStateEnum>)? updateSelectedTodo;
  final bool isUpdate;
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final File? localFile;
  final TodoStateEnum todoStateEnum;
  const CreateTodoScreenUI(
      {super.key,
      required this.formKey,
      required this.pickImage,
      required this.isUpdate,
      required this.titleController,
      required this.bodyController,
      this.localFile,
      required this.todoStateEnum,
      required this.createNewTodo,
      this.updateSelectedTodo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                          actions: [
                            IconButton(
                                onPressed: pickImage,
                                icon: const Icon(Icons.attach_file_sharp))
                          ],
                          title: FadeInRight(
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                  isUpdate ? "Edit Todo" : "Create Todo"))),
                      Column(
                        children: [
                          FadeInRight(
                            duration: const Duration(milliseconds: 500),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  const AppTextH2(
                                    fontWeight: FontWeight.bold,
                                    text: "Create Todo",
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const SmallText(
                                    text: "Create your todo here",
                                  ),
                                  InputText(
                                      textInputType: TextInputType.name,
                                      textEditingController: titleController,
                                      password: false,
                                      hint: "Title",
                                      validator: (password) {
                                        final passWordRule = Rule(
                                          password,
                                          name: "Title",
                                          isRequired: true,
                                        );
                                        if (passWordRule.hasError) {
                                          return passWordRule.error;
                                        } else {
                                          return null;
                                        }
                                      }),
                                  InputText(
                                      textEditingController: bodyController,
                                      password: false,
                                      hint: "Body",
                                      validator: (password) {
                                        final passWordRule = Rule(
                                          password,
                                          name: "Body",
                                          isRequired: true,
                                        );
                                        if (passWordRule.hasError) {
                                          return passWordRule.error;
                                        } else {
                                          return null;
                                        }
                                      }),
                                  localFile != null
                                      ? Image.file(localFile!)
                                      : const SizedBox(),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SegmentedButton<TodoStateEnum>(
                                    segments: const <ButtonSegment<
                                        TodoStateEnum>>[
                                      ButtonSegment<TodoStateEnum>(
                                        value: TodoStateEnum.pending,
                                        label: Text("Pending"),
                                      ),
                                      ButtonSegment<TodoStateEnum>(
                                        value: TodoStateEnum.inProgress,
                                        label: Text('in Progress'),
                                      ),
                                      ButtonSegment<TodoStateEnum>(
                                        value: TodoStateEnum.completed,
                                        label: Text('Completed'),
                                      ),
                                    ],
                                    selected: <TodoStateEnum>{todoStateEnum},
                                    onSelectionChanged: updateSelectedTodo,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  AppButton(
                                    function: () {
                                      createNewTodo();
                                    },
                                    child: Center(
                                      child: Text(
                                        isUpdate ? "Edit Todo" : "Create",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(""),
                      const Text("")
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
