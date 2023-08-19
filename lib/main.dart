import 'package:flutter/material.dart';
import 'package:kalanapp/main_menu.dart';
import 'package:kalanapp/services/notification_services.dart';
import 'splash_screen.dart';
import '/view/get_started_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
