import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashViewModel = Provider<SplashViewModel>((ref) => SplashViewModel());

class SplashViewModel {
  void initTimer(BuildContext context, {required Widget screen}) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            )));
  }
}
