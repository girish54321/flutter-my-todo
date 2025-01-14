import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/EditeProfile/EditeProfileScreenUI.dart';
import 'package:reqres_app/App/FileHelper/imagePicker.dart';
import 'package:reqres_app/state/authState.dart';
import 'package:reqres_app/state/settingsState.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<EditProfileScreen> {
  final SettingController settingController =
      GetInstance().put<SettingController>(SettingController());

  final AuthController authController =
      GetInstance().put<AuthController>(AuthController());

  final firstName = TextEditingController();
  final lastNmae = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? localFile;

  Future<void> pickImage() async {
    var file = await Imagepicker().imagePicker();
    if (file != null) {
      setState(() {
        localFile = file;
      });
    }
  }

  @override
  void initState() {
    firstName.text = authController.userProfile.value?.firstName ?? "";
    lastNmae.text = authController.userProfile.value?.lastName ?? "";
    super.initState();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastNmae.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EditeProfileScreenUI(
      formKey: _formKey,
      authController: authController,
      localFile: localFile,
      pickImage: pickImage,
      firstName: firstName,
      lastName: lastNmae,
    );
  }
}
