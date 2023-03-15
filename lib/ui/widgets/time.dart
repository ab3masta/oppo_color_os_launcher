import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String formattedTime = DateFormat.Hm().format(DateTime.now());
  late Timer _timer;

  void _update() {
    setState(() {
      formattedTime = DateFormat.Hm().format(DateTime.now());
    });
  }

  @override
  void initState() {
    _timer =
        Timer.periodic(const Duration(milliseconds: 100), (timer) => _update());
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          Text(
            formattedTime,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 70, color: Colors.white),
          ),
          Text(
            DateFormat('yMMMMEEEEd').format(DateTime.now()),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
