import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_way_bd_task/core/utils/app_colors.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static void showSnackbar(String message, {double bottomMargin = 16}) {
    Get.closeAllSnackbars();
    Get.closeCurrentSnackbar();
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        duration: const Duration(seconds: 1),
        // backgroundColor: Colors.grey,
        backgroundColor: AppColors.snackbarBackground,
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
