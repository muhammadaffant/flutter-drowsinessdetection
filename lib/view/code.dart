import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_awake_3/utils/global.colors.dart';
import 'package:keep_awake_3/view/home.view.dart';
import 'package:keep_awake_3/view/widgets/button.global.dart';
import 'package:keep_awake_3/view/otp.view.dart';
import 'package:keep_awake_3/view/widgets/text.form.global.dart';
import 'package:keep_awake_3/view/register.view.dart';
import 'package:http/http.dart' as http;

class CodePage extends StatefulWidget {
  CodePage({Key? key}) : super(key: key);

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  final TextEditingController emailController = TextEditingController();

  Future<void> _code() async {
    final String code = emailController.text;

    final response = await http.get(
      Uri.parse('http://192.168.43.76:5000/user'),
      headers: {'Authorization': code},
      // body: jsonEncode({'key': 'value'}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      // TODO: Handle successful login and navigate to another page
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['message'];
      // TODO: Display login error message
    }
  }

  bool passVisible = false;
  @override
  void initState() {
    super.initState();
    passVisible = true;
  }

  // final TextEditingController handphoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Keep Awake',
                    style: TextStyle(
                        color: GlobalColors.scndColor,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 70),

                Text(
                  'Masuk ke',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  'Akun Anda',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w200),
                ),

                // const SizedBox(height: 50),

                // Text(
                //   'Belum punya akun?',
                //   style: TextStyle(
                //     color: GlobalColors.textColor,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w100
                //   ),
                // ),
                // Text(
                //   'Daftar',
                //   style: TextStyle(
                //     color: GlobalColors.textColor,
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold
                //   ),
                // ),

                const SizedBox(height: 90),

                //// email input
                TextFormGlobal(
                  controller: emailController,
                  text: 'OTP BEARER',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),

                const SizedBox(height: 20),

                //// password input
                // TextFormGlobal(
                //   controller: passwordController,
                //   text: 'Password',
                //   obscure: true,
                //   textInputType: TextInputType.emailAddress,
                // ),

                const SizedBox(height: 20),

                //// no hp input
                // TextFormGlobal(
                //   controller: handphoneController,
                //   text: 'Handphone',
                //   obscure: false,
                //   textInputType: TextInputType.emailAddress,
                // ),

                // const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: _code,
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

                //  Positioned(
                //     bottom: -30,
                //     right: 30,
                //     child: Padding(
                //     padding: const EdgeInsets.all(40.0),
                //     child: GestureDetector(
                //       onTap: () {
                //         Navigator.pushReplacement(context,
                //             MaterialPageRoute(builder: (_) => const OTPScreen()));
                //       },
                //     child: Container(
                //       padding: const EdgeInsets.all(22),
                //       height: 60,
                //       width: 60,
                //       decoration: const BoxDecoration(
                //         gradient: LinearGradient(
                //             colors: [
                //               Color(0xffEFE89D),
                //               Color(0xffEFE89D),
                //             ],
                //             stops: [
                //               0.0,
                //               1.0
                //             ],
                //             begin: FractionalOffset.topLeft,
                //             end: FractionalOffset.bottomRight),
                //         shape: BoxShape.circle,
                //       ),
                //       child: Image.asset('assets/right-arrow.png'),
                //     ),
                //   ),
                //     ),
                //     ),

                // const ButtonGlobal(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: GlobalColors.scndColor,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum punya akun?',
            ),
            InkWell(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => RegisterView()));
                  },
                  child: Text(
                    ' Daftar',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
