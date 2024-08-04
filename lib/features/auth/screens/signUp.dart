import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plv/features/auth/controller/auth_controller.dart';
import 'package:plv/features/auth/model/register_model.dart';
import 'package:plv/features/home/screens/home.dart';
import 'package:plv/utils/constants/colors.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _selectedOption = 'client';
  String? _fileName;
  PlatformFile? _selectedFile;
  bool _isLoading = false;

  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  List<dynamic> wilayas = [];
  List<dynamic> communes = [];
  List<dynamic> filteredCommunes = [];
  String? selectedWilaya;
  String? selectedCommune;

  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedOption = value!;
      if (_selectedOption == 'Option 2') {
        _fileName = null;
      }
    });
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _selectedFile = result.files.single;
      });
    }
  }

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });
    String? base64File;
    // Convert file to base64
    if (_selectedFile != null) {
      base64File = base64Encode(await File(_selectedFile!.path!).readAsBytes());
    }

    Register reg = Register(
        email: emailController.text,
        password: passwordController.text,
        first_name: nameController.text,
        phone: mobileController.text,
        typeUser: _selectedOption,
        file: base64File);

    AuthController authController = Get.put(AuthController());
    bool success = await authController.register(reg);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      Get.to(const Home());
    } else {
      // Handle registration failure (e.g., show an error message)
    }
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png", height: 100),
                  const SizedBox(height: 20),
                  const Text(
                    'Inscription',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Créez votre compte',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Nom et Prénom',
                      prefixIcon:
                          const Icon(Icons.person, color: TColors.softGrey),
                      labelStyle: const TextStyle(color: TColors.softGrey),
                      floatingLabelStyle:
                          const TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      prefixIcon:
                          const Icon(Icons.phone, color: TColors.softGrey),
                      labelStyle: const TextStyle(color: TColors.softGrey),
                      floatingLabelStyle:
                          const TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon:
                          const Icon(Icons.email, color: TColors.softGrey),
                      labelStyle: const TextStyle(color: TColors.softGrey),
                      floatingLabelStyle:
                          const TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      prefixIcon:
                          const Icon(Icons.lock, color: TColors.softGrey),
                      labelStyle: const TextStyle(color: TColors.softGrey),
                      floatingLabelStyle:
                          const TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  const Text("Type Utilisateur",
                      style: TextStyle(
                          color: TColors.softGrey,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: const Text(
                          'Departement Marketing Communication',
                          style: TextStyle(color: TColors.softGrey),
                        ),
                        leading: Radio<String>(
                          fillColor: WidgetStateProperty.all(TColors.secondary),
                          value: 'client',
                          groupValue: _selectedOption,
                          onChanged: _handleRadioValueChange,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'professionnel Communication Publicité',
                          style: TextStyle(color: TColors.softGrey),
                        ),
                        leading: Radio<String>(
                          fillColor: WidgetStateProperty.all(TColors.secondary),
                          value: 'fournisseur_non_valide',
                          groupValue: _selectedOption,
                          onChanged: _handleRadioValueChange,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _selectedOption == "fournisseur_non_valide"
                          ? ElevatedButton(
                              onPressed: _pickFile,
                              child: const Text('Register Commerce'),
                            )
                          : const SizedBox(),
                      if (_fileName != null) ...[
                        const SizedBox(height: 20),
                        Text('Selected file: $_fileName'),
                      ],
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      foregroundColor: TColors.black,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text('S\'inscrire'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Déjà un compte ? ",
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const Login());
                        },
                        child: const Text(
                          'Connectez-vous',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
