// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:elangsung_test_mobile/shared/constanta.dart';
import 'package:elangsung_test_mobile/widget/button_half_widger.dart';
import 'package:elangsung_test_mobile/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isHidden = true;
  bool _isSelected = false;

  bool isUsername = false;
  bool isPass = false;
  bool isRegister = false;
  String email = '';
  String username = '';
  String password = '';
  String fakultas = '';
  String jurusan = '';
  String message = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cPrimaryOrange,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 54),
              Container(
                margin: EdgeInsets.only(left: 40),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                        color: cEigthGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    // SizedBox(height: 10),
                    // Text(
                    //   "Silahkan login untuk masuk aplikasi",
                    //   style: TextStyle(
                    //     color: cEigthGrey,
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.normal,
                    //   ),
                    //   textAlign: TextAlign.left,
                    // ),
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
                        // onSaved: (input) => requestModel.password = passwordController.text,
                        controller: passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: cThreedGrey,),
                          hintText: "Password Lama",
                          border: InputBorder.none,
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: cThreedGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        // onSaved: (input) => requestModel.newPassword = newPasswordController.text,
                        controller: newPasswordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: cThreedGrey,),
                          hintText: "Password Baru",
                          border: InputBorder.none,
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: cThreedGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        // onSaved: (input) => requestModel.confirmPassword = confirmPasswordController.text,
                        controller: confirmPasswordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: cThreedGrey,),
                          hintText: "Ulangi Password",
                          border: InputBorder.none,
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: cThreedGrey,
                            ),
                          ),
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
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}