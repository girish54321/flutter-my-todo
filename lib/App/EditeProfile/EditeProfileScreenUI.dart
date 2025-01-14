import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/state/authState.dart';
import 'package:reqres_app/widget/appInputText.dart';
import 'package:reqres_app/widget/appNetworkImage.dart';
import 'package:reqres_app/widget/appText.dart';
import 'package:reqres_app/widget/buttons.dart';
import 'package:rules/rules.dart';

class EditeProfileScreenUI extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AuthController authController;
  final File? localFile;
  final Function()? pickImage;
  final TextEditingController firstName;
  final TextEditingController lastName;

  const EditeProfileScreenUI(
      {super.key,
      required this.formKey,
      required this.authController,
      this.localFile,
      this.pickImage,
      required this.firstName,
      required this.lastName});

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
                          title: FadeInRight(
                              duration: const Duration(milliseconds: 500),
                              child: const Text("Edit Profile"))),
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
                                  Obx(() {
                                    return Align(
                                      child: SizedBox(
                                        height: 140,
                                        width: 140,
                                        child: Stack(children: [
                                          ...?authController
                                              .userProfile.value?.files
                                              ?.map(
                                            (e) {
                                              return SizedBox(
                                                height: 140,
                                                width: 140,
                                                child: localFile != null
                                                    ? Container(
                                                        decoration:
                                                            BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99),
                                                        image: DecorationImage(
                                                          image: FileImage(
                                                              localFile!),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ))
                                                    : AppNetWorkIamge(
                                                        radius: 99,
                                                        imageUrl:
                                                            "${SERVER_URL}/${e?.fileName ?? ""}"),
                                              );
                                            },
                                          ),
                                          Positioned(
                                              right: 1,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: Colors.white,
                                                  ),
                                                  child: IconButton(
                                                      onPressed: pickImage,
                                                      icon: const Icon(
                                                        Icons.edit,
                                                        color: Colors.pink,
                                                      )))),
                                        ]),
                                      ),
                                    );
                                  }),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  const SmallText(
                                    text: "Edit your profile",
                                  ),
                                  InputText(
                                      textInputType: TextInputType.name,
                                      textEditingController: firstName,
                                      password: false,
                                      hint: "First Name",
                                      validator: (password) {
                                        final passWordRule = Rule(
                                          password,
                                          name: "First Name",
                                          isRequired: true,
                                        );
                                        if (passWordRule.hasError) {
                                          return passWordRule.error;
                                        } else {
                                          return null;
                                        }
                                      }),
                                  InputText(
                                      textEditingController: lastName,
                                      password: false,
                                      hint: "Last Name",
                                      validator: (password) {
                                        final passWordRule = Rule(
                                          password,
                                          name: "Last Name",
                                          isRequired: true,
                                        );
                                        if (passWordRule.hasError) {
                                          return passWordRule.error;
                                        } else {
                                          return null;
                                        }
                                      }),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  AppButton(
                                    function: () {
                                      if (formKey.currentState!.validate()) {
                                        var parameter = {
                                          "firstName": firstName.text,
                                          "lastName": lastName.text,
                                        };
                                        authController.updateProfile(
                                            parameter, localFile);
                                      }
                                    },
                                    child: const Center(
                                      child: Text(
                                        "Update",
                                        style: TextStyle(
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
