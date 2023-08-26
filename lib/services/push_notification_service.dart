import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<Map> messageStream = StreamController.broadcast();
  static Stream<Map> get messageStreamGet => messageStream.stream;

  static Future _onBackgroundHandler(RemoteMessage message) async {
    print('Background Handler ${message.messageId}');
    print('Data: ${message.data}');

    messageStream.add(message.data);
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('Message Handler ${message.messageId}');
    print('Data: ${message.data}');
    messageStream.add(message.data);
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('MessageOpenApp Handler ${message.messageId}');
    print('Data: ${message.data}');
    messageStream.add(message.data);
  }

  static Future initializeApp() async {
    //Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('El Token Es: $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreaams() {
    messageStream.close();
  }
}
