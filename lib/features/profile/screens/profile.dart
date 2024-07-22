import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:plv/navigation.dart';
import '../../auth/screens/login.dart';
import 'update_profile.dart';
import 'orders.dart';
import 'package:plv/utils/theme/theme.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: darkMode ? TColors.white : TColors.dark),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Profile', style: TextStyle(color: darkMode ? TColors.white : TColors.dark)),
        backgroundColor: darkMode ? TColors.dark : TColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.md),
        child: Column(
          children: [
            CircleAvatar(
              radius: TSizes.iconLg,
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
            ),
            SizedBox(height: TSizes.sm),
            Text(
              'Test',
              style: TextStyle(
                fontSize: TSizes.fontSizeLg,
                fontWeight: FontWeight.bold,
                color: darkMode ? TColors.white : TColors.textPrimary,
              ),
            ),
            Text(
              'test@gmail.com',
              style: TextStyle(
                fontSize: TSizes.fontSizeMd,
                color: darkMode ? TColors.lightGrey : TColors.textSecondary,
              ),
            ),
            SizedBox(height: TSizes.lg),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => UpdateProfile());
                },
                child: Text('Modifier le profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.secondary,
                  side: BorderSide.none,
                  foregroundColor: TColors.black,
                  shape: StadiumBorder(),
                ),
              ),
            ),
            SizedBox(height: TSizes.lg),
            ListTile(
              onTap: (){Get.to(() => OrdersPage());},
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.primary.withOpacity(0.1),
                ),
                child: Icon(Iconsax.shop, color: darkMode ? TColors.secondary : TColors.primary),
              ),
              title: Text('Mes achats', style: TextStyle(color: darkMode ? TColors.white : TColors.textPrimary)),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.grey.withOpacity(0.1),
                ),
                child: Icon(Iconsax.arrow_right_3, color: darkMode ? TColors.softGrey : TColors.darkGrey),
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.primary.withOpacity(0.1),
                ),
                child: Icon(Iconsax.shopping_cart, color: darkMode ? TColors.secondary : TColors.primary),
              ),
              title: Text('Suivi colis', style: TextStyle(color: darkMode ? TColors.white : TColors.textPrimary)),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.grey.withOpacity(0.1),
                ),
                child: Icon(Iconsax.arrow_right_3, color: darkMode ? TColors.softGrey : TColors.darkGrey),
              ),
            ),
            ListTile(
              onTap: (){
                Get.to(() => Login());
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.primary.withOpacity(0.1),
                ),
                child: Icon(Iconsax.logout, color: darkMode ? TColors.secondary : TColors.primary),
              ),
              title: Text('Déconnecter', style: TextStyle(color: darkMode ? TColors.white : TColors.textPrimary)),
            ),
          ],
        ),
      ),
    );
  }
}
