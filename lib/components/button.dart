import 'package:flutter/material.dart';
import 'package:pf_app/core/config/config.dart';

class XButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool loading;
  final String text;
  Color? backgroundColor;

  XButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.loading, this.backgroundColor})
      : super(key: key);

  @override
  _XButtonState createState() => _XButtonState();
}

class _XButtonState extends State<XButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        backgroundColor: widget.backgroundColor ?? XColors.body,
      ),
      onPressed: widget.loading ? null : widget.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.loading)
            const Row(
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
                  child: Center(
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 1.0),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          Text(widget.text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white))
        ],
      ),
    );
  }
}
