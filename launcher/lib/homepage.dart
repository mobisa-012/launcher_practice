// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Launcher'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Text('Karen Hospital'),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              child: const Icon(
                Icons.call,
                size: 30,
                color: Colors.black,
              ),
              onTap: () async {
                const phoneNumber = '+254796116642';
                const url = 'tel:$phoneNumber';
                //const url = 'sms:$phoneNumber';
              },
            )
          ]),
          onPressed: () async {
            const url = 'https://karenhospital.org';
            openBrowserURL(url: url, inApp: true);
          },
        ),
      ),
    );
  }

  Future openBrowserURL({required String url, bool inApp = false}) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    }
  }
}
