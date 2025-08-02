import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static void showSnackbar(String message, {double bottomMargin = 16}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.grey,
        margin: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: bottomMargin,
        ),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 8,
      ),
    );
  }
}