import 'package:flutter/material.dart';
import 'package:keep_awake_3/view/home.view.dart';
import 'package:keep_awake_3/view/otp.view.dart';
import 'package:keep_awake_3/view/edit.profile.view.dart';
import 'package:keep_awake_3/utils/global.colors.dart';
import 'package:keep_awake_3/view/widgets/button.global.dart';
import 'package:keep_awake_3/view/login.view.dart';
import 'package:keep_awake_3/view/profile.view.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:camera/camera.dart';

class DetectionScreen extends StatefulWidget {
  @override
  _DetectionScreenState createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deteksi'),
      ),
      body: WebView(
        initialUrl:
            'http://192.168.43.76:5000/detection', // Ganti dengan URL server Flask Anda
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
