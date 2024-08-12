import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? fcmToken;
  HomePage({super.key, this.fcmToken});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset("assets/logo.png"),
          leadingWidth: 100,
          title: Text(
            "Главная Страница",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(widget.fcmToken ?? "..."))),
      ),
    );
  }
}
