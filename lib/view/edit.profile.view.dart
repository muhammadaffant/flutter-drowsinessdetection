import 'package:flutter/material.dart';
import 'package:keep_awake_3/utils/global.colors.dart';
import 'package:keep_awake_3/view/home.view.dart';
import 'package:keep_awake_3/view/widgets/button.global.dart';
import 'package:keep_awake_3/view/widgets/text.form.global.dart';
import 'package:keep_awake_3/view/login.view.dart';
import 'package:keep_awake_3/view/register.view.dart';
import 'package:keep_awake_3/view/otp.view.dart';
import 'package:keep_awake_3/view/profile.view.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Edit Profil",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
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
              MaterialPageRoute(
                builder: (BuildContext context) => ProfilePage(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout_outlined,
              color: GlobalColors.scndColor,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginView(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 15),

              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: GlobalColors.scndColor,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35),

              buildTextField("Username", "Isikan nama lengkap", false),

              SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(),
                      ),
                    );
                  },
                  text: "Simpan",
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

              SizedBox(
                height: 40,
              ),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  text: "Batal",
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

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     ElevatedButton(
              //     // OutlineButton(
              //       // padding: EdgeInsets.symmetric(horizontal: 50),
              //       // shape: RoundedRectangleBorder(
              //       //     borderRadius: BorderRadius.circular(20)),
              //       onPressed: () {},
              //       child: Text("CANCEL",
              //           style: TextStyle(
              //               fontSize: 14,
              //               letterSpacing: 2.2,
              //               color: GlobalColors.mainColor)),
              //     ),
              //     ElevatedButton(
              //     // RaisedButton(
              //       onPressed: () {},
              //       // color: Colors.green,
              //       // padding: EdgeInsets.symmetric(horizontal: 50),
              //       // elevation: 2,
              //       // shape: RoundedRectangleBorder(
              //       //     borderRadius: BorderRadius.circular(20)),
              //       child: Text(
              //         "SAVE",
              //         style: TextStyle(
              //             fontSize: 14,
              //             letterSpacing: 2.2,
              //             color: GlobalColors.mainColor),
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(
                      () {
                        showPassword = !showPassword;
                      },
                    );
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: GlobalColors.textColor,
          ),
        ),
      ),
    );
  }
}
