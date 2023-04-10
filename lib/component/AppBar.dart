import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class CustomAppBar {
  static Widget customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Color(0xFF4A3122),
        elevation: 0,
      ),
    );
  }
}