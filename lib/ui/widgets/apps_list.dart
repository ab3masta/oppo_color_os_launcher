import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:oppo_launcher/ui/widgets/apps_row.dart';

class Apps extends StatelessWidget {
  final List<Application>? apps;

  const Apps({Key? key, required this.apps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - (kToolbarHeight * 1.8),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: apps == null
                        ? Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.transparent,
                                child: const CircularProgressIndicator()),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppsRow(apps: apps, start: 0, end: 4),
                              AppsRow(apps: apps, start: 4, end: 8),
                              AppsRow(apps: apps, start: 8, end: 12),
                              AppsRow(apps: apps, start: 12, end: 16),
                              AppsRow(apps: apps, start: 16, end: 20),
                            ],
                          ))
              ],
            ),
          ),
        ));
  }
}
