import 'package:flutter/material.dart';
import 'package:pf_app/components/sidebar.dart';
import 'package:pf_app/core/config/config.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: XColors.dark,
      body: Column(
        children: [
          const SizedBox(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Sidebar()],
          ))
        ],
      ),
    ));
  }
}
