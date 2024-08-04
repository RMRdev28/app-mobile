import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:plv/features/auth/middleware/auth_guard.dart';
import 'package:plv/features/auth/screens/login.dart';
import 'package:plv/features/home/screens/home.dart';
import 'package:plv/features/profile/screens/profile.dart';
import 'package:plv/features/shop/screens/shop.dart';
import 'package:plv/utils/constants/text_strings.dart';
import 'package:plv/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(
          name: '/shop',
          page: () => const Shop(),
          middlewares: [AuthGuard()],
        ),
      ],
      // home: const Home(), // S
    );
  }
}
