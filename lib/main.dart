import 'package:flutter/material.dart';
import 'package:oppo_launcher/app.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return const App();
    }),
  );
}
