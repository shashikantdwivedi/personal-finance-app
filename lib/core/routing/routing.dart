import 'package:flutter/material.dart';
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
      default:
        return MaterialPageRoute(
            builder: (_) => const XOnline(child: SplashScreen()),
            settings: settings);
    }
  }
}
