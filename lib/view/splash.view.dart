import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_awake_3/utils/global.colors.dart';
import 'package:keep_awake_3/view/home.view.dart';
import 'package:keep_awake_3/view/login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.to(HomePage());
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: const Center(
        child: Text(
          'Keep Awake',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
