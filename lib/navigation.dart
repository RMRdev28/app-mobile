import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plv/features/auth/screens/login.dart';
import 'package:plv/features/home/screens/home.dart';
import 'package:plv/features/profile/screens/profile.dart';
import 'package:plv/features/shop/screens/shop.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/device/device_utility.dart';
import 'package:plv/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  final NavigationController controller = Get.put(NavigationController());

  NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Obx(() => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.changePage,
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
        ));
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;
  RxList<Widget> pages = RxList<Widget>();
  List<String> routes = ['/home', '/shop', '/favorite', 'profile'];

  @override
  void onInit() {
    // print("init");
    super.onInit();
    _buildPages();
  }

  Future<void> _buildPages() async {
    bool isLoggedIn = await _isLoggedIn();
    pages.clear();

    pages.add(const Home());
    pages.add(const Shop());
    pages.add(const Center(child: Text('Favorites Page')));

    if (isLoggedIn) {
      pages.add(const Profile());
    } else {
      pages.add(
          const Login()); // Or any placeholder widget indicating the user needs to log in
    }
  }

  Future<bool> _isLoggedIn() async {
    String? token = await TDeviceUtils().getToken();
    print("token $token");
    return token != null && token.isNotEmpty;
  }

  void changePage(int index) {
    selectedIndex.value = index;
    Get.toNamed(
      routes[index],
    );
  }
}
