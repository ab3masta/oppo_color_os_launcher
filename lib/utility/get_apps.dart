import 'package:device_apps/device_apps.dart';

List<Application> getHomeApps(List<Application> apps) {
  List<Application> homeApps = [];
  if (getPlayStoreApp(apps) != null) {
    homeApps.add(getPlayStoreApp(apps)!);
  }
  if (getPhotosApp(apps) != null) {
    homeApps.add(getPhotosApp(apps)!);
  }

  if (getMusicApp(apps) != null) {
    homeApps.add(getMusicApp(apps)!);
  }

  if (getGmailApp(apps) != null) {
    homeApps.add(getGmailApp(apps)!);
  }

  return homeApps;
}

List<Application> getHomeBasicApps(List<Application> allAppsWithLaunchIntent,
    List<Application> allAppsWithoutLaunchIntent) {
  List<Application> homeBasicApps = [];
  if (getPhoneApp(allAppsWithLaunchIntent, allAppsWithoutLaunchIntent) !=
      null) {
    homeBasicApps
        .add(getPhoneApp(allAppsWithLaunchIntent, allAppsWithoutLaunchIntent)!);
  }

  if (getSMSApp(allAppsWithLaunchIntent) != null) {
    homeBasicApps.add(getSMSApp(allAppsWithLaunchIntent)!);
  }

  if (getCameraApp(allAppsWithLaunchIntent) != null) {
    homeBasicApps.add(getCameraApp(allAppsWithLaunchIntent)!);
  }

  if (getBrowserApp(allAppsWithLaunchIntent) != null) {
    homeBasicApps.add(getBrowserApp(allAppsWithLaunchIntent)!);
  }

  return homeBasicApps;
}

Application? getPhoneApp(List<Application> allAppsWithLaunchIntent,
    List<Application> allAppsWithoutLaunchIntent) {
  List<Application> theApps = [];
  theApps = allAppsWithoutLaunchIntent
      .where((e) => "com.android.phone" == e.packageName)
      .toList();
  return theApps.isNotEmpty ? theApps[0] : null;
}

Application? getSMSApp(List<Application> apps) {
  List<Application> theApps = [];
  theApps = apps
      .where((e) =>
          e.packageName.split(".").toList().contains("messaging") ||
          e.packageName.split(".").toList().contains("mms") ||
          e.packageName.split(".").toList().contains("sms"))
      .toList();
  return theApps.isNotEmpty ? theApps[0] : null;
}

Application? getBrowserApp(List<Application> apps) {
  List<Application> theApps = [];
  theApps = apps
      .where((e) =>
          e.packageName.split(".").toList().contains("browser") ||
          e.packageName.split(".").toList().contains("chrome"))
      .toList();
  return theApps.isNotEmpty ? theApps[0] : null;
}

///
Application? getCameraApp(List<Application> apps) {
  List<Application> theApps = [];
  theApps = apps
      .where((e) =>
          e.packageName.split(".").toList().contains("camera") ||
          e.packageName.split(".").toList().contains("camera2"))
      .toList();
  return theApps.isNotEmpty ? theApps[0] : null;
}

///
Application? getPlayStoreApp(List<Application> apps) {
  List<Application> theApps = [];
  theApps = apps.where((e) => "com.android.vending" == e.packageName).toList();
  return theApps.isNotEmpty ? theApps[0] : null;
}

///
Application? getGmailApp(List<Application> apps) {
  List<Application> theApps = [];
  theApps =
      apps.where((e) => "com.google.android.gm" == e.packageName).toList();
  return theApps.isNotEmpty ? theApps[0] : null;
}

///
Application? getPhotosApp(List<Application> apps) {
  List<Application> theApps = [];
  theApps = apps
      .where((e) =>
          e.packageName.split(".").toList().contains("gallery") ||
          e.packageName.split(".").toList().contains("gallery3d") ||
          e.packageName.split(".").toList().contains("photos"))
      .toList();
  return theApps.isNotEmpty ? theApps[0] : null;
}

///
Application? getMusicApp(List<Application> apps) {
  List<Application> theApps = [];
  theApps = apps
      .where((e) => e.packageName.split(".").toList().contains("music"))
      .toList();
  return theApps.isNotEmpty ? theApps[0] : null;
}
