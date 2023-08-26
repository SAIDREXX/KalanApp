import 'package:flutter/material.dart';
import 'package:kalanapp/main_menu.dart';
import 'package:kalanapp/services/notification_services.dart';
import 'package:kalanapp/services/push_notification_service.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'splash_screen.dart';
import '/view/get_started_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await PushNotificationService.initializeApp();
  await initNotifications();
  OneSignal.initialize("32db9ec0-4bbe-4d41-8903-3080e6994b4f");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    PushNotificationService.messageStreamGet.listen((message) {
      print('Main: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalan',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(),
      routes: {
        '/getStarted': (context) => const GetStartedPage(),
        '/home': (context) => const MainMenu(),
      },
    );
  }
}
