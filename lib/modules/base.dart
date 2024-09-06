import 'package:flutter/material.dart';
import 'package:pf_app/components/sidebar.dart';
import 'package:pf_app/core/config/config.dart';

class Base extends StatefulWidget {
  final Widget child;

  const Base({Key? key, required this.child}) : super(key: key);

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
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Sidebar(), Expanded(child: widget.child)],
          ))
        ],
      ),
    ));
  }
}
