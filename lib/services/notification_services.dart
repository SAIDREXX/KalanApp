import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kalanapp/services/push_notification_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotificaction() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'Kalan',
    'KalanChannel',
    importance: Importance.max,
  );
  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );
  PushNotificationService.messageStreamGet.listen((message) async {
    String accountName = message['accountName'];
    String userStatus = message['status'];

    await flutterLocalNotificationsPlugin.show(
      5,
      'Kalan',
      'El usuario $accountName ha establecido su estado como: $userStatus',
      notificationDetails,
    );
  });
}
