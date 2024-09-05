import 'package:flutter/material.dart';

class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  _NoConnectionScreenState createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/images/no-internet.png', width: MediaQuery.of(context).size.width * 0.5),
        )
    ));
  }
}