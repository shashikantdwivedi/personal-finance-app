import 'package:flutter/material.dart';
import 'package:pf_app/modules/account/ui/accounts_screen.dart';
import 'package:pf_app/modules/auth/ui/login_screen.dart';
import 'package:pf_app/modules/base.dart';
import 'package:pf_app/modules/dashboard/ui/dashboard_screen.dart';
import '../../components/online.dart';
import '../../modules/splash/ui/splash_screen.dart';

part 'routes.dart';

class Routing {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
            builder: (_) => const XOnline(child: SplashScreen()),
            settings: settings);
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => const XOnline(child: LoginScreen()),
            settings: settings);
      case Routes.dashboard:
        return MaterialPageRoute(
            builder: (_) => const XOnline(child: Base(child: DashboardScreen(),)),
            settings: settings);
      case Routes.accounts:
        return MaterialPageRoute(
            builder: (_) => const XOnline(child: Base(child: AccountsScreen(),)),
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const XOnline(child: SplashScreen()),
            settings: settings);
    }
  }
}
