import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:get/get.dart';
// import 'package:plv/utils/theme/theme.dart';

class UpdateProfile extends StatelessWidget {
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

  UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: darkMode ? TColors.white : TColors.dark),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Modification de Profile',
            style: TextStyle(color: darkMode ? TColors.white : TColors.dark)),
        backgroundColor: darkMode ? TColors.dark : TColors.white,
      ),
      body: Column(
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
                      items: <String>['Boumerdès', 'Alger', 'Oran']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                      // To set a default value
                      value: 'Boumerdès',
                    ),
                    const SizedBox(height: TSizes.md),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Commune',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                      items: <String>['Boumerdès', 'Alger', 'Oran']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                      // To set a default value
                      value: 'Boumerdès',
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
                        child: Text('Modifier'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
