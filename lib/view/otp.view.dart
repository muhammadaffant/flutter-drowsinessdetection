import 'package:flutter/material.dart';
import 'package:keep_awake_3/utils/global.colors.dart';
import 'package:keep_awake_3/view/edit.profile.view.dart';
import 'package:keep_awake_3/view/home.view.dart';
import 'package:keep_awake_3/view/widgets/button.global.dart';
import 'package:keep_awake_3/view/widgets/text.form.global.dart';
import 'package:keep_awake_3/view/login.view.dart';
import 'package:keep_awake_3/view/register.view.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Keep Awake',
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 80.0,
                color: GlobalColors.scndColor,
              ),
            ),

            const SizedBox(height: 30.0),
            
            Text(
              'VERIFIKASI KODE',
              style: TextStyle(
                fontWeight: FontWeight.w200, 
                fontSize: 18.0,
                color: GlobalColors.textColor,
              ),
              // style: Theme.of(context).textTheme.headline6
            ),

            const SizedBox(height: 40.0),
            
            Text(
              "Masukan kode verifikasi yang sudah Anda dapatkan",
              style: TextStyle(
                fontWeight: FontWeight.w200, 
                fontSize: 14.0,
                color: GlobalColors.textColor,
              ),
              // textAlign: TextAlign.center
            ),
            
            const SizedBox(height: 20.0),
            
            OtpTextField(
                cursorColor: GlobalColors.scndColor,
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.white,
                filled: true,
                onSubmit: (code) => print("OTP is => $code"),),
            
            const SizedBox(height: 40.0),
            
            SizedBox(
              width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(),),);
                  },
                  text: "Verifikasi",
                  ),
              // child: GestureDetector(
              //       onTap: (){
              //         Navigator.pushReplacement(context,
              //               MaterialPageRoute(builder: (_) => EditProfile()));
              //       },
              //       child: Text(
              //         ' Verifikasi',
              //         style: TextStyle(
              //           color: GlobalColors.scndColor,
              //         ),
              //       )
              //       ),
            ),
          ],
        ),
      ),
    );
  }
}