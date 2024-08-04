import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:plv/base_template.dart';
import 'package:plv/features/auth/controller/auth_controller.dart';
import 'package:plv/features/auth/model/user_model.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:plv/utils/device/device_utility.dart';
// import 'package:plv/navigation.dart';
import '../../auth/screens/login.dart';
import 'update_profile.dart';
import 'orders.dart';
// import 'package:plv/utils/theme/theme.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  final AuthController _authController = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    User? fetchedUser = await TDeviceUtils().getUser();
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return BaseTemplate(
      body: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          children: [
            const CircleAvatar(
              radius: TSizes.iconLg,
              backgroundImage:
                  AssetImage('assets/images/profile_placeholder.png'),
            ),
            const SizedBox(height: TSizes.sm),
            Text(
              user?.first_name ?? 'Test',
              style: TextStyle(
                fontSize: TSizes.fontSizeLg,
                fontWeight: FontWeight.bold,
                color: darkMode ? TColors.white : TColors.textPrimary,
              ),
            ),
            Text(
              user?.email ?? 'test@gmail.com',
              style: TextStyle(
                fontSize: TSizes.fontSizeMd,
                color: darkMode ? TColors.lightGrey : TColors.textSecondary,
              ),
            ),
            const SizedBox(height: TSizes.lg),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => UpdateProfile());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.secondary,
                  side: BorderSide.none,
                  foregroundColor: TColors.black,
                  shape: const StadiumBorder(),
                ),
                child: const Text('Modifier le profile'),
              ),
            ),
            const SizedBox(height: TSizes.lg),
            ListTile(
              onTap: () {
                Get.to(() => Orders());
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.primary.withOpacity(0.1),
                ),
                child: Icon(Iconsax.shop,
                    color: darkMode ? TColors.secondary : TColors.primary),
              ),
              title: Text('Mes achats',
                  style: TextStyle(
                      color: darkMode ? TColors.white : TColors.textPrimary)),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.grey.withOpacity(0.1),
                ),
                child: Icon(Iconsax.arrow_right_3,
                    color: darkMode ? TColors.softGrey : TColors.darkGrey),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.primary.withOpacity(0.1),
                ),
                child: Icon(Iconsax.shopping_cart,
                    color: darkMode ? TColors.secondary : TColors.primary),
              ),
              title: Text('Suivi colis',
                  style: TextStyle(
                      color: darkMode ? TColors.white : TColors.textPrimary)),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.grey.withOpacity(0.1),
                ),
                child: Icon(Iconsax.arrow_right_3,
                    color: darkMode ? TColors.softGrey : TColors.darkGrey),
              ),
            ),
            ListTile(
              onTap: () {
                _authController.logout();
                Get.offAll(() => const Login());
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.primary.withOpacity(0.1),
                ),
                child: Icon(Iconsax.logout,
                    color: darkMode ? TColors.secondary : TColors.primary),
              ),
              title: Text('Déconnecter',
                  style: TextStyle(
                      color: darkMode ? TColors.white : TColors.textPrimary)),
            ),
          ],
        ),
      ),
    );
  }
}
