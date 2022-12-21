// ignore_for_file: unnecessary_null_comparison, import_of_legacy_library_into_null_safe, unused_import, unnecessary_import,, prefer_equal_for_default_values
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:no_more_anxiety/routes.dart';


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
const DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
  requestSoundPermission: false,
  requestBadgePermission: false,
  requestAlertPermission: false,
  onDidReceiveLocalNotification: onDidReceiveLocalNotification,
);
const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid, iOS: initializationSettingsDarwin);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);


void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) {
  if (kDebugMode) {
    print("localnotification");
  }
}

void onDidReceiveNotificationResponse(NotificationResponse details) {
  if (kDebugMode) {
    print("notificationresponse");
  }
}


const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('0', 'myChannelName',
        channelDescription: 'my description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

await flutterLocalNotificationsPlugin.show(
  0,
  'Notification title',
  'Notification body',
  notificationDetails,
);