import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:keep_awake_3/utils/global.colors.dart';
import 'package:keep_awake_3/view/widgets/button.global.dart';
import 'package:keep_awake_3/view/widgets/text.form.global.dart';
import 'package:keep_awake_3/view/login.view.dart';
import 'package:http/http.dart' as http;

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController password2Controller = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  Future<void> _regist() async {
    final String user = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String repassword = password2Controller.text;

    final response = await http.post(
      Uri.parse('http://192.168.43.76:5000/signup'),
      body: jsonEncode({
        'username': user,
        'email': email,
        'password': password,
        're_password': repassword,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginView()));
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
                  'Buat Akun',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  'Baru',
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

                //// username input
                TextFormGlobal(
                  controller: usernameController,
                  text: 'Username',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                //// email input
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                //// password input
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  obscure: true,
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                //// password input
                TextFormGlobal(
                  controller: password2Controller,
                  text: 'Re Password',
                  obscure: true,
                  textInputType: TextInputType.emailAddress,
                ),

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
                    onPressed: _regist,
                    //   () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginView(),),);
                    // },
                    text: "Daftar",
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

                // Positioned(
                //     bottom: -30,
                //     right: 30,
                //     child: Padding(
                //     padding: const EdgeInsets.all(40.0),
                //     child: GestureDetector(
                //       onTap: () {
                //         Navigator.pushReplacement(context,
                //             MaterialPageRoute(builder: (_) => LoginView()));
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
              'Sudah punya akun?',
            ),
            InkWell(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => LoginView()),
                    );
                  },
                  child: Text(
                    ' Masuk',
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
