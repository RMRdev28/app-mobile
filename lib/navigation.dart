import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:plv/common/widgets/appBar/app_bar.dart';
import 'package:plv/features/home/screens/home.dart';
import 'package:plv/features/shop/screens/shop.dart';
import 'package:plv/features/profile/screens/profile.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/helpers/helper_functions.dart';

import 'features/profile/screens/update_profile.dart';

class NavigationMenu extends StatelessWidget {
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Obx(() => controller
          .buildPage(controller.selectedIndex.value)), // Build the current page
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: controller.changePage, // Handle page changes
            backgroundColor: darkMode ? TColors.dark : TColors.white,
            indicatorColor: darkMode
                ? TColors.white.withOpacity(0.1)
                : TColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Favorites'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          )),
    );
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;
  final pages = <Widget>[
    const Home(), // Add the Home widget to the pages list
    const Shop(),
    const Center(child: Text('Favorites Page')),
    Profile(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }

  Widget buildPage(int index) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false, // Show back arrow only if not on HomePage
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
          width: 150,
          fit: BoxFit.contain,
        ), // Display page name for other screens
      ),
      body: pages[index],
    );
  }
}
