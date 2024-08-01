import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublié'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: TColors.primaryBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: TColors.primary.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min, // This will center the container vertically
                children: [
                  Center(
                    child: Text(
                      'Réinitialisation de mot de passe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: TColors.darkGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre adresse e-mail';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return 'L\'adresse e-mail n\'pas valide';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Action pour "Se connecter"
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primaryBackground,
                          foregroundColor: TColors.primary,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Se connecter'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Action pour "Envoyer lien"
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primary,
                          foregroundColor: TColors.secondary,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Envoyer lien'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
