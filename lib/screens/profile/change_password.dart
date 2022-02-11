// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, unused_field, unnecessary_new

import 'package:elangsung_test_mobile/models/models.dart';
import 'package:elangsung_test_mobile/screens/profile/profile.dart';
import 'package:elangsung_test_mobile/services/services.dart';
import 'package:elangsung_test_mobile/shared/constanta.dart';
import 'package:elangsung_test_mobile/widget/button_half_widger.dart';
import 'package:elangsung_test_mobile/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  ChangePasswordRequestModel requestModel;

  bool _isHidden1 = true;
  bool _isHidden2 = true;
  bool _isHidden3 = true;
  bool isLoading = false;

  bool isUsername = false;
  bool isPass = false;
  bool isRegister = false;
  String password = '';
  String newpassword = '';
  String confirmpassword = '';

  @override
  void initState() {
    super.initState();
    requestModel = new ChangePasswordRequestModel(
      password: password,
      newpassword: newpassword,
      confirmpassword: confirmpassword,
    );
  }

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
                        onSaved: (input) => requestModel.password = passwordController.text,
                        controller: passwordController,
                        obscureText: _isHidden1,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: cThreedGrey,),
                          hintText: "Password Lama",
                          border: InputBorder.none,
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView1,
                            child: Icon(
                              _isHidden1
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
                        onSaved: (input) => requestModel.newpassword = newpasswordController.text,
                        controller: newpasswordController,
                        obscureText: _isHidden2,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: cThreedGrey,),
                          hintText: "Password Baru",
                          border: InputBorder.none,
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView2,
                            child: Icon(
                              _isHidden2
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
                        onSaved: (input) => requestModel.confirmpassword = confirmpasswordController.text,
                        controller: confirmpasswordController,
                        obscureText: _isHidden3,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: cThreedGrey,),
                          hintText: "Ulangi Password",
                          border: InputBorder.none,
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView3,
                            child: Icon(
                              _isHidden3
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
                  if (validateAndSave()) {
                    setState(() {
                      isLoading = true;
                    });
                    ChangePasswordServices changePasswordServices = new ChangePasswordServices();
                    changePasswordServices.changePassword(requestModel).then(
                      (value) {
                        if (value.status == true) {
                          final snack = SnackBar(
                            content: Text(
                              value.message,
                            ),
                            duration: Duration(seconds: 3),
                          );
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: ProfileScreen(),
                            ),
                          );
                        }
                        else {
                          final snack = SnackBar(
                            content: Text(
                              value.message,
                            ),
                            duration: Duration(seconds: 3),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        }
                      }
                    );
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }

  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  void _togglePasswordView3() {
    setState(() {
      _isHidden3 = !_isHidden3;
    });
  }
}