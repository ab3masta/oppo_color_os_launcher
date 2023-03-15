import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:oppo_launcher/ui/screens/launcher_home.dart';
import 'package:oppo_launcher/ui/widgets/apps_list.dart';
import 'package:oppo_launcher/ui/widgets/apps_pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<Application>? theApp, launcherHomeApps;
  List<Widget> appWidgets = [];

  @override
  void initState() {
    appInfo();
    super.initState();
  }

  Future<void> appInfo() async {
    List<Application> allApps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );

    // for (var element in allApps) {
    //   print("//? element.packageName ==> ${element.packageName} ");
    // }

    setState(() {
      launcherHomeApps = allApps
          .where((e) => [
                "com.coloros.filemanager",
                "com.coloros.safecenter",
                "com.coloros.gallery3d",
              ].contains(e.packageName))
          .toList();
      theApp = allApps
          .where((e) => [
                "com.android.contacts",
                "com.android.mms",
                "com.oppo.camera",
                "com.android.browser"
              ].contains(e.packageName))
          .toList();
      appWidgets = [
        LauncherHome(
          launcherHomeApps: launcherHomeApps,
        )
      ];
    });

    initAppWidgets(allApps, start: 0, end: 20);
  }

  void initAppWidgets(List<Application> allApps,
      {int start = 0, int end = 20}) {
    if (allApps.length >= end) {
      setState(() {
        appWidgets.add(Apps(apps: allApps.sublist(start, end)));
      });

      initAppWidgets(allApps, start: end, end: end + 20);
    } else {
      setState(() {
        appWidgets.add(Apps(apps: allApps.sublist(start, allApps.length)));
      });

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/default-wallpapers.png",
              fit: BoxFit.fitHeight,
            ),
            Column(
              children: [
                Expanded(child: AppsPages(appWidgets: appWidgets)),
                theApp != null
                    ? SizedBox(
                        height: kToolbarHeight * 1.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: theApp!
                              .map((e) => InkWell(
                                    onTap: () {
                                      DeviceApps.openApp(e.packageName);
                                      // Navigator.pop(context, [e]);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        e is ApplicationWithIcon
                                            ? SizedBox(
                                                height: kToolbarHeight * 0.9,
                                                width: kToolbarHeight * 0.9,
                                                child: Image.memory(
                                                  e.icon,
                                                  fit: BoxFit.cover,
                                                ))
                                            : const SizedBox(
                                                child: Text('color'),
                                              ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            e.appName,
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
                                  ))
                              .toList(),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

Widget buildIcons(void Function() fn, Icon xicon) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child: IconButton(icon: xicon, onPressed: fn),
  );
}
