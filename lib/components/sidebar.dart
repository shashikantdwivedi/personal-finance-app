import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pf_app/core/config/config.dart';

import '../core/routing/routing.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: XColors.body,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Image(image: AssetImage("assets/images/logo.png")),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                // Check if route is dashboard and set the color to XColors.primary
                color: ModalRoute.of(context)?.settings.name == Routes.dashboard
                    ? XColors.primary.withOpacity(0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              leading: Icon(Iconsax.home_1_outline,
                  color:
                      ModalRoute.of(context)?.settings.name == Routes.dashboard
                          ? Colors.white
                          : const Color(0xFFA3A3A3)),
              title: Text('Dashboard',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ModalRoute.of(context)?.settings.name ==
                                Routes.dashboard
                            ? Colors.white
                            : const Color(0xFFA3A3A3),
                      )),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              // Check if route is dashboard and set the color to XColors.primary
                color: ModalRoute.of(context)!.settings.name!.contains(Routes.accounts)
                    ? XColors.primary.withOpacity(0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              leading: Icon(Iconsax.bank_outline,
                  color:
                  ModalRoute.of(context)!.settings.name!.contains(Routes.accounts)
                      ? Colors.white
                      : const Color(0xFFA3A3A3)),
              title: Text('Accounts',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ModalRoute.of(context)!.settings.name!.contains(Routes.accounts)
                        ? Colors.white
                        : const Color(0xFFA3A3A3),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
