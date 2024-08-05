import 'package:bakery_app_ui/screens/home_page.dart';
import 'package:bakery_app_ui/screens/orders_page.dart';
import 'package:bakery_app_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'chat_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [HomePage(), _Navbar()],
      ),
    );
  }
}

class _Navbar extends StatelessWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 10.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultBorderRadiusCircular),
                topRight: Radius.circular(defaultBorderRadiusCircular))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const _NavbarIcon(
              label: "Home",
              icon: Icons.home,
              isActive: true,
            ),
            _NavbarIcon(
              label: "Orders",
              icon: Icons.shopping_bag,
              isActive: false,
              func: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPage(),
                  )),
            ),
            const _NavbarIcon(
              label: "Favorite",
              icon: Icons.favorite,
              isActive: false,
            ),
            _NavbarIcon(
              label: "Chat",
              icon: Icons.chat,
              isActive: false,
              func: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(),
                  )),
            ),
            const _NavbarIcon(
              label: "Profile",
              icon: Icons.person,
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavbarIcon extends StatelessWidget {
  const _NavbarIcon(
      {required this.label,
      required this.icon,
      required this.isActive,
      this.func});
  final String label;
  final IconData icon;
  final bool isActive;
  final Function()? func;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Column(
        children: [
          isActive
              ? Container(
                  width: 20,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 10,
                ),
          const SizedBox(
            height: 8,
          ),
          Icon(icon,
              size: 18.sp,
              color: isActive
                  ? primaryColor.withOpacity(0.6)
                  : Colors.blueGrey[300]!.withOpacity(0.6)),
          const SizedBox(
            height: 4,
          ),
          Text(label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isActive
                        ? primaryColor.withOpacity(0.8)
                        : Colors.blueGrey[300]!,
                  ))
        ],
      ),
    );
  }
}
