import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController mobileController;
  late TextEditingController addressController;
  late TextEditingController wilayaController;
  late TextEditingController communeController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    mobileController = TextEditingController();
    addressController = TextEditingController();
    wilayaController = TextEditingController();
    communeController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    wilayaController.dispose();
    communeController.dispose();
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
            SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png", height: 100),
                  SizedBox(height: 20),
                  Text(
                    'Inscription',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
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
                  SizedBox(height: 20),
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: 'Prénom',
                      prefixIcon: Icon(Icons.person, color: TColors.softGrey),
                      labelStyle: TextStyle(color: TColors.softGrey),
                      floatingLabelStyle: TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      prefixIcon: Icon(Icons.person, color: TColors.softGrey),
                      labelStyle: TextStyle(color: TColors.softGrey),
                      floatingLabelStyle: TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      prefixIcon: Icon(Icons.phone, color: TColors.softGrey),
                      labelStyle: TextStyle(color: TColors.softGrey),
                      floatingLabelStyle: TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Adresse',
                      prefixIcon: Icon(Icons.home, color: TColors.softGrey),
                      labelStyle: TextStyle(color: TColors.softGrey),
                      floatingLabelStyle: TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: wilayaController,
                    decoration: InputDecoration(
                      labelText: 'Wilaya',
                      prefixIcon: Icon(Icons.location_city, color: TColors.softGrey),
                      labelStyle: TextStyle(color: TColors.softGrey),
                      floatingLabelStyle: TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: communeController,
                    decoration: InputDecoration(
                      labelText: 'Commune',
                      prefixIcon: Icon(Icons.location_on, color: TColors.softGrey),
                      labelStyle: TextStyle(color: TColors.softGrey),
                      floatingLabelStyle: TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email, color: TColors.softGrey),
                      labelStyle: TextStyle(color: TColors.softGrey),
                      floatingLabelStyle: TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      prefixIcon: Icon(Icons.lock, color: TColors.softGrey),
                      labelStyle: TextStyle(color: TColors.softGrey),
                      floatingLabelStyle: TextStyle(color: TColors.softGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: TColors.softGrey),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('S\'inscrire'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      foregroundColor: TColors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Déjà un compte ? ", style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Get.to(() => Login());
                        },
                        child: Text(
                          'Connectez-vous',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
