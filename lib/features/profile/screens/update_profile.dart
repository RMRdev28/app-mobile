import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:plv/utils/theme/theme.dart';
import 'package:plv/base_template.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  List<dynamic> wilayas = [];
  List<dynamic> communes = [];
  List<dynamic> filteredCommunes = [];
  String? selectedWilaya;
  String? selectedCommune;

  final TextEditingController nameController =
      TextEditingController(text: 'Test Nom');
  final TextEditingController emailController =
      TextEditingController(text: 'test@gmail.com');
  final TextEditingController phoneController =
      TextEditingController(text: '123456789');
  final TextEditingController addressController =
      TextEditingController(text: '123 Rue Exemple');
  final TextEditingController passwordController =
      TextEditingController(text: 'password');
  final TextEditingController confirmPasswordController =
      TextEditingController(text: 'password');

  @override
  void initState() {
    super.initState();
    loadWilayas().then((data) {
      setState(() {
        wilayas = data;
      });
      print("Wilayas loaded: $wilayas");
    });
    loadCommunes().then((data) {
      setState(() {
        communes = data;
      });
      print("Communes loaded: $communes");
    });
  }

  Future<List<dynamic>> loadWilayas() async {
    final String response = await rootBundle
        .loadString('assets/AlgeriaCities/Wilaya_Of_Algeria.json');
    print("Wilayas JSON response: $response");
    return json.decode(response);
  }

  Future<List<dynamic>> loadCommunes() async {
    final String response = await rootBundle
        .loadString('assets/AlgeriaCities/Commune_Of_Algeria.json');
    print("Communes JSON response: $response");
    return json.decode(response);
  }

  void filterCommunes(String wilayaId) {
    setState(() {
      filteredCommunes = communes
          .where((commune) => commune['wilaya_id'] == wilayaId)
          .toList();
      selectedCommune = null; // Reset selectedCommune when wilaya changes
    });
    print("Filtered Communes for Wilaya ID $wilayaId: $filteredCommunes");
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return BaseTemplate(
        body: Padding(
        padding: const EdgeInsets.all(TSizes.md),
    child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: TSizes.iconLg,
                      backgroundImage:
                          AssetImage('assets/images/profile_placeholder.png'),
                    ),
                    const SizedBox(height: TSizes.md),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nom et Prenom',
                        prefixIcon: Icon(Icons.person),
                        hintStyle: TextStyle(
                            color: Colors.grey), // Grey color for placeholder
                      ),
                    ),
                    const SizedBox(height: TSizes.md),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'E-Mail',
                        prefixIcon: Icon(Icons.email),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: TSizes.md),
                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone No',
                        prefixIcon: Icon(Icons.phone),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: TSizes.md),
                    TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        prefixIcon: Icon(Icons.home),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: TSizes.md),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Wilaya',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                      items: wilayas
                          .map<DropdownMenuItem<String>>((dynamic value) {
                        return DropdownMenuItem<String>(
                          value: value['id'],
                          child: Text(value['name']),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedWilaya = newValue;
                          filterCommunes(newValue!);
                        });
                      },
                      value: selectedWilaya,
                    ),
                    const SizedBox(height: TSizes.md),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Commune',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                      items: filteredCommunes
                          .map<DropdownMenuItem<String>>((dynamic value) {
                        return DropdownMenuItem<String>(
                          value: value['id'],
                          child: Text(value['name']),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCommune = newValue;
                        });
                      },
                      value: selectedCommune,
                    ),
                    const SizedBox(height: TSizes.md),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: TSizes.md),
                    TextField(
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: TSizes.lg),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.secondary,
                          side: BorderSide.none,
                          foregroundColor: TColors.black,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Modifier'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
