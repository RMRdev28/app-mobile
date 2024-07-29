import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
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
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/shop': (context) => const Shop(),
        '/profile': (context) => const Profile(),
        // Define more routes here
      },
      // home: const Home(), // S
    );
  }
}
