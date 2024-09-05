import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'core/providers/connectivity.dart';
import 'core/routing/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
            headlineLarge: GoogleFonts.poppins(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.w600),
            headlineMedium: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500),
            headlineSmall: GoogleFonts.poppins(
                fontSize: 21,
                color: Colors.black,
                fontWeight: FontWeight.w600),
            bodyLarge: GoogleFonts.poppins(fontSize: 26, color: Colors.black),
          )),
      initialRoute: Routes.splash,
      onGenerateRoute: Routing.allRoutes,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    );
  }
}
