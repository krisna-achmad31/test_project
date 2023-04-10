
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_project/component/text.dart';

class SplashScreen extends StatelessWidget {
  static const routedName = '/splashPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextRegularExo(
            label: 'Achmad Yukrisna',
          ),
        ),
      ),

    );
  }
}
