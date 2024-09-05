import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pf_app/core/config/config.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'core/providers/connectivity.dart';
import 'core/routing/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1024, 768),
    center: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ConnectivityProvider>(context, listen: false)
          .syncConnectivityStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PERSONAL FINANCE APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
            headlineLarge: GoogleFonts.ibmPlexSansCondensed(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.w600),
            headlineMedium: GoogleFonts.ibmPlexSansCondensed(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500),
            headlineSmall: GoogleFonts.ibmPlexSansCondensed(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.w500),
            bodyLarge: GoogleFonts.ibmPlexSans(fontSize: 16, color: Colors.white),
          )),
      initialRoute: Routes.dashboard,
      onGenerateRoute: Routing.allRoutes,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    );
  }
}
