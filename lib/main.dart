import 'package:flutter/material.dart';
import 'package:oppo_launcher/app.dart';
import 'package:sizer/sizer.dart';

// TODO: add request permission to set this launcher as default launcher
void main() {
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return const App();
    }),
  );
}
