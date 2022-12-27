// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    tz.initializeTimeZones();
  }

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

    // Set default location to Paris
    tz.setLocalLocation(tz.getLocation('Europe/Paris'));
  }

  Future<void> showNotification() async {
    final scheduledTime =
        tz.TZDateTime.now(tz.local).add(const Duration(hours: 8));
    const notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails('1', 'random channel',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker'));

    await flutterLocalNotificationsPlugin.zonedSchedule(0, 'N\'oublie pas',
        '1 personne t\'aime.', scheduledTime, notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }
}
