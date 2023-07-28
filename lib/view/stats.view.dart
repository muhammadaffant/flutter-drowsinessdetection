import 'package:flutter/material.dart';
import 'package:keep_awake_3/view/home.view.dart';
import 'package:keep_awake_3/view/otp.view.dart';
import 'package:keep_awake_3/view/edit.profile.view.dart';
import 'package:keep_awake_3/utils/global.colors.dart';
import 'package:keep_awake_3/view/widgets/button.global.dart';
import 'package:keep_awake_3/view/login.view.dart';
import 'package:keep_awake_3/view/profile.view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            'http://192.168.43.76:8501', // Ganti dengan URL akhir endpoint Streamlit
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
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
    body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 170),
              Text(
                'Statistik',
                style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
