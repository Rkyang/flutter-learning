import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToastUtils {
  static bool showLoading = false;

  static void showToast(BuildContext context, String msg) {
    if (showLoading) {
      return;
    }

    showLoading = true;
    Future.delayed(Duration(seconds: 3), () {
      showLoading = false;
    });

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
