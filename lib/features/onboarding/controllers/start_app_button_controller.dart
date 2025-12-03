import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartAppButtonController {
  void startApp(BuildContext context) {
    context.go('/home');
  }
}
