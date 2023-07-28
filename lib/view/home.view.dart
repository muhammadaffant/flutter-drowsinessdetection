import 'package:flutter/material.dart';
import 'package:keep_awake_3/view/otp.view.dart';
import 'package:keep_awake_3/view/edit.profile.view.dart';
import 'package:keep_awake_3/utils/global.colors.dart';
import 'package:keep_awake_3/view/profile.view.dart';
import 'package:keep_awake_3/view/widgets/bottom.navigation.dart';
import 'package:keep_awake_3/view/widgets/button.global.dart';
import 'package:keep_awake_3/view/login.view.dart';
import 'package:keep_awake_3/view/stats.view.dart';
import 'package:keep_awake_3/view/detect.view.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as https;
import 'package:keep_awake_3/view/history.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  // Future<List<CameraDescription>> getAvailableCameras() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   return await availableCameras();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      // bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        backgroundColor: GlobalColors.mainColor,
        // elevation: 1,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: GlobalColors.scndColor,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //           builder: (BuildContext context) => OTPScreen()));
        //   },
        // ),
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
                  'Keselamatan adalah prioritas utama. Keep Awake akan selalu menjaga Anda dari kantuk.',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w200),
                ),
                const SizedBox(height: 230.0),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StatsPage(),
                        ),
                      );
                    },
                    text: "Statistik",
                  ),
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetectionScreen(),
                        ),
                      );
                    },
                    text: "Mulai Deteksi",
                  ),
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        ),
                      );
                    },
                    text: "History",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
