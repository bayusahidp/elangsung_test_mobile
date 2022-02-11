// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, unused_field, unused_element, unnecessary_new, deprecated_member_use, avoid_single_cascade_in_expression_statements

import 'package:elangsung_test_mobile/models/models.dart';
import 'package:elangsung_test_mobile/screens/login/login.dart';
import 'package:elangsung_test_mobile/services/services.dart';
import 'package:elangsung_test_mobile/shared/constanta.dart';
import 'package:elangsung_test_mobile/widget/button_half_outline_widget.dart';
import 'package:elangsung_test_mobile/widget/button_half_widger.dart';
import 'package:elangsung_test_mobile/widget/text_field_widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fakultasController = TextEditingController();
  TextEditingController jurusanController = TextEditingController();

  RegisterRequestModel requestModel;

  bool _isHidden = true;
  bool _isSelected = false;

  bool isUsername = false;
  bool isPass = false;
  bool isRegister = false;
  String name = '';
  String email = '';
  String username = '';
  String password = '';
  String fakultas = '';
  String jurusan = '';
  String message = '';

  @override
  void initState() {
    super.initState();
    requestModel = new RegisterRequestModel(
      name: name,
      email: email,
      username: username,
      password: password,
      fakultas: fakultas,
      jurusan: jurusan,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      "Register",
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
                        onSaved: (input) => requestModel.name = nameController.text,
                        controller: nameController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person, color: cThreedGrey,),
                          hintText: "Full Name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        onSaved: (input) => requestModel.email = emailController.text,
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
                        onSaved: (input) => requestModel.username = usernameController.text,
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
                        onSaved: (input) => requestModel.fakultas = fakultasController.text,
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
                        onSaved: (input) => requestModel.jurusan = jurusanController.text,
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
                        onSaved: (input) => requestModel.password = passwordController.text,
                        controller: passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, color: cThreedGrey,),
                          hintText: "Password",
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
                text: "Register",
                colorback: cPrimaryOrange,
                press: () {
                  if (validateAndSave()) {
                    setState(() {
                      isRegister = true;
                    });
                    RegisterServices registerServices = new RegisterServices();
                    registerServices.register(requestModel).then(
                      (value) {
                        if (value.status == true) {
                          final snack = SnackBar(
                            content: Text(
                              value.message,
                            ),
                            duration: Duration(seconds: 3),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: LoginScreen(),
                            ),
                          );
                        }
                        else {
                          Flushbar(
                            flushbarPosition: FlushbarPosition.TOP,
                            flushbarStyle: FlushbarStyle.GROUNDED,
                            message:  value.message,
                            duration:  Duration(seconds: 3),
                          )..show(context);
                        }
                      }
                    );
                  }
                }
              ),
              SizedBox(height: 17),
              ButtonHalfOutlineWidget(
                text: "Login",
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
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}