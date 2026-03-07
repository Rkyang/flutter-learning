import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToastUtils {
  static void showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 200,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        content: Text(msg, textAlign: TextAlign.center,),
      ),
    );
  }
}
