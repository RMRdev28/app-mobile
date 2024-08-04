import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:plv/app.dart';
import 'package:plv/firebase_options.dart';
import 'package:plv/utils/device/device_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final fireBaseInstance = FirebaseMessaging.instance;
  final fcmToken = await fireBaseInstance.getToken();
  final firebaseAccedTopic =
      await fireBaseInstance.subscribeToTopic("new_products");
  final notificationSettings =
      await fireBaseInstance.requestPermission(provisional: true);
  await TDeviceUtils().saveDeviceToken(fcmToken);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const App());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
