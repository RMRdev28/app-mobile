import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plv/features/auth/controller/auth_controller.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();
    return authController.isLoggedIn.value
        ? null
        : const RouteSettings(name: '/login');
  }
}
