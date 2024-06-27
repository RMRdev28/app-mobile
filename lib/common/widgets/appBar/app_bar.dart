import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plv/utils/constants/colors.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.showBackArrow = false,
    this.title,
    this.onCartIconPressed, // Add a callback for the cart icon press
  });

  final bool showBackArrow;
  final Widget? title;
  final VoidCallback? onCartIconPressed; // Callback function type

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: TColors.primary,
      title: title,
      actions: [
        IconButton(
          icon:  const Icon(Iconsax.shopping_cart),
          color: TColors.secondary, onPressed: () {  },
        ),
      ],
      toolbarHeight: 60,
      flexibleSpace: Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
