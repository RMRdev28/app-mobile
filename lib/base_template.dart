import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plv/common/widgets/appBar/app_bar.dart';
import 'package:plv/navigation.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/helpers/helper_functions.dart';

class BaseTemplate extends StatelessWidget {
  final Widget body;

  const BaseTemplate({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: false,
      ),
      body: body,
      bottomNavigationBar: NavigationMenu(),
    );
  }
}
