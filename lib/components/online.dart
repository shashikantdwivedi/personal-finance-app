import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/providers/connectivity.dart';
import '../modules/connectivity/ui/no_connection_screen.dart';

class XOnline extends StatefulWidget {
  final Widget child;
  const XOnline({Key? key, required this.child}) : super(key: key);

  @override
  _XOnlineState createState() => _XOnlineState();
}

class _XOnlineState extends State<XOnline> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<ConnectivityProvider>(context).isConnected ? widget.child : const NoConnectionScreen();
  }
}