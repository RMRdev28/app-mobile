import 'dart:ffi';

import 'package:get/get.dart';
import 'package:plv/features/auth/model/user_model.dart';
import 'package:plv/features/auth/model/register_model.dart';
import 'package:plv/utils/device/device_utility.dart';
import 'package:plv/utils/http/http_client.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  Future<User> login(String email, String password) async {
    final response = await HttpHelper.post("login/", {
      "email": email,
      "password": password,
    });
    final userJson = response['data']['user'] as Map<String, dynamic>;
    final token = response['data']['token'] as String;

    final user = User.fromJson(userJson);

    await TDeviceUtils().saveToken(token);
    await TDeviceUtils().saveUser(user);
    // print("loggedIn");
    return user;
  }

  Future<void> logout() async {
    final response = await HttpHelper.post("logout/", {}, auth: true);
    await TDeviceUtils().removeToken();
    await TDeviceUtils().deleteUser();
    print("loggedOut");
  }

  Future<bool> register(Register register) async {
    final response = await HttpHelper.post("register/", register.toJson());
    final userJson = response['data']['user'] as Map<String, dynamic>;
    final token = response['data']['token'] as String;

    final user = User.fromJson(userJson);

    await TDeviceUtils().saveToken(token);
    await TDeviceUtils().saveUser(user);
    // print("loggedIn");
    return true;
  }

  Future<void> checkToken() async {
    String? token = await TDeviceUtils().getToken();
    isLoggedIn.value = token != null;
  }
}
