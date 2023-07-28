import 'package:flutter/material.dart';
import 'package:keep_awake_3/view/home.view.dart';
import 'package:keep_awake_3/view/otp.view.dart';
import 'package:keep_awake_3/view/edit.profile.view.dart';
import 'package:keep_awake_3/utils/global.colors.dart';
import 'package:keep_awake_3/view/widgets/button.global.dart';
import 'package:keep_awake_3/view/login.view.dart';
import 'package:keep_awake_3/view/profile.view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      appBar: AppBar(
        backgroundColor: GlobalColors.mainColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: GlobalColors.scndColor,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_2_outlined,
              color: GlobalColors.scndColor,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePage()));
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: 'http://192.168.43.76:5000/data',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
