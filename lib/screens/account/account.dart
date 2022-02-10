// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:elangsung_test_mobile/screens/account/change_password.dart';
import 'package:elangsung_test_mobile/screens/login/login.dart';
import 'package:elangsung_test_mobile/shared/constanta.dart';
import 'package:elangsung_test_mobile/widget/avatar_oval_widget.dart';
import 'package:elangsung_test_mobile/widget/button_half_outline_widget.dart';
import 'package:elangsung_test_mobile/widget/button_half_widger.dart';
import 'package:elangsung_test_mobile/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fakultasController = TextEditingController();
  TextEditingController jurusanController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  bool _isHidden = true;
  bool _isSelected = false;

  bool isUsername = false;
  bool isPass = false;

  String imgurl = '';
  String name = 'Cahyo Bayu Sahid Pratomo';
  String username = 'bayusahidp';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                // ignore: deprecated_member_use
                overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200,
                    width: size.width,
                    color: cPrimaryOrange,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Column(
                          children: [
                            AvatarOval(
                              imageUrl: imgurl,
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Change Avatar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldContainer(
                    child: TextFormField(
                      // onSaved: (input) => requestModel.name = nameController.text,
                      controller: nameController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person, color: cThreedGrey,),
                        hintText: "Nama Lengkap",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      // onSaved: (input) => requestModel.email = emailController.text,
                      controller: emailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email, color: cThreedGrey,),
                        hintText: "Email",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      // onSaved: (input) => requestModel.username = usernameController.text,
                      controller: usernameController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person, color: cThreedGrey,),
                        hintText: "Username",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      // onSaved: (input) => requestModel.fakultas = fakultasController.text,
                      controller: fakultasController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.school, color: cThreedGrey,),
                        hintText: "Fakultas",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      // onSaved: (input) => requestModel.jurusan = jurusanController.text,
                      controller: jurusanController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.business_center, color: cThreedGrey,),
                        hintText: "Jurusan",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      // onSaved: (input) => requestModel.alamat = alamatController.text,
                      controller: alamatController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.map, color: cThreedGrey,),
                        hintText: "Alamat",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27),
            ButtonHalfWidget(
              text: "Save",
              colorback: cPrimaryOrange,
              press: () {
                
              }
            ),
            SizedBox(height: 17),
            ButtonHalfWidget(
              text: "Change Password",
              colorback: cSecondaryBlue,
              press: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: ChangePasswordScreen(),
                  ),
                );
              }
            ),
            SizedBox(height: 17),
            ButtonHalfOutlineWidget(
              text: "Logout",
              press: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: LoginScreen(),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}