import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Уведомления"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(message.notification!.title.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(message.notification!.body.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      message.data.isNotEmpty ? message.data.toString() : ""),
                )
              ],
            )));
  }
}
