import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      required this.title,
      required this.content,
      this.showCancel = false,
      this.onPressedOk,
      this.okColor});
  final String title;
  final String content;
  final bool showCancel;
  final VoidCallback? onPressedOk;
  final Color? okColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red),
      ),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          content,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onPressedOk ?? () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
              backgroundColor: okColor,
              foregroundColor: okColor != null ? Colors.white : null),
          child: Text("OK"),
        ),
        if (showCancel)
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("cancel"),
          ),
      ]),
    );
  }
}
