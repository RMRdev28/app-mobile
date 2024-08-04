import 'package:flutter/material.dart';
import 'package:plv/features/auth/controller/auth_controller.dart';
import 'package:plv/features/home/screens/home.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'signUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthController _authController = Get.put(AuthController());
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool rememberMe = false;
  bool isLoading = false;

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await _authController.login(
          emailController.text, passwordController.text);
      Get.to(() => const Home());
    } catch (e) {
      // Handle login error here
      print('Login error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
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
                    'Connexion',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Connectez-vous à votre compte',
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
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                        activeColor: TColors.secondary,
                        checkColor: Colors.black,
                        side: const BorderSide(
                          color: TColors
                              .softGrey, // Couleur lorsqu'elle n'est pas activée
                        ),
                      ),
                      const Text('Se souvenir de moi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Mot de passe oublié',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TColors.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            foregroundColor: TColors.black,
                          ),
                          child: const Text('Se connecter'),
                        ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Vous n'avez pas de compte ? ",
                              style: TextStyle(color: Colors.white)),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const SignUp());
                            },
                            child: const Text(
                              'S\'inscrire',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const Home());
                        },
                        child: const Text(
                          'Skip',
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
