import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class AppsRow extends StatelessWidget {
  const AppsRow(
      {Key? key, required this.apps, required this.start, required this.end})
      : super(key: key);
  final List<Application>? apps;
  final int start, end;

  @override
  Widget build(BuildContext context) {
    return (apps!.length > start && apps!.length >= end)
        ? SizedBox(
            height:
                (MediaQuery.of(context).size.height - kToolbarHeight * 3) / 5,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: apps!.sublist(start, end).map((app) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        DeviceApps.openApp(app.packageName);
                        Navigator.pop(context, [app]);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          app is ApplicationWithIcon
                              ? SizedBox(
                                  height: kToolbarHeight * 0.9,
                                  width: kToolbarHeight * 0.9,
                                  child: Image.memory(
                                    app.icon,
                                    fit: BoxFit.cover,
                                  ))
                              : const SizedBox(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              app.appName,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList()),
          )
        : (apps!.length > start && apps!.length < end)
            ? SizedBox(
                height:
                    (MediaQuery.of(context).size.height - kToolbarHeight * 3) /
                        5,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: apps!.sublist(start, apps!.length).map((app) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            DeviceApps.openApp(app.packageName);
                            Navigator.pop(context, [app]);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              app is ApplicationWithIcon
                                  ? SizedBox(
                                      height: kToolbarHeight * 0.9,
                                      width: kToolbarHeight * 0.9,
                                      child: Image.memory(
                                        app.icon,
                                        fit: BoxFit.cover,
                                      ))
                                  : const SizedBox(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  app.appName,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList()),
              )
            : const SizedBox();
  }
}
