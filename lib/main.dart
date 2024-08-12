import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jele_app/firebase_options.dart';
import 'package:jele_app/pages/home_page.dart';
import 'package:jele_app/pages/notification_page.dart';

import 'controllers/firebase_api.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _fcmToken;

  @override
  void initState() {
    super.initState();
    _fetchFcmToken();
  }

  Future<void> _fetchFcmToken() async {
    final token = await FirebaseApi().getFcmToken();
    setState(() {
      _fcmToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(fcmToken: _fcmToken),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_screen': (context) => const NotificationPage(),
      },
    );
  }
}
