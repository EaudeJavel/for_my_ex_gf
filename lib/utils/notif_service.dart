// ignore_for_file: unnecessary_null_comparison, import_of_legacy_library_into_null_safe, unused_import, unnecessary_import,, prefer_equal_for_default_values
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:no_more_anxiety/routes.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifs() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  Future<void> showNotification() async {
    await flutterLocalNotificationsPlugin.show(
      0,
      'Notif title',
      'Notif body',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    var navigatorKey = GlobalKey<NavigatorState>();
    final BuildContext context = navigatorKey.currentContext!;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => const MyHomePage()),
    );
  }
}

const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
  '1',
  'random channel',
  importance: Importance.max,
  priority: Priority.high,
  ticker: 'ticker',
);

const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
