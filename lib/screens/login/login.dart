// ignore_for_file: prefer_const_constructors_in_immutables, unused_field, prefer_final_fields, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, deprecated_member_use, avoid_single_cascade_in_expression_statements

import 'package:elangsung_test_mobile/models/models.dart';
import 'package:elangsung_test_mobile/screens/profile/profile.dart';
import 'package:elangsung_test_mobile/screens/register/register.dart';
import 'package:elangsung_test_mobile/services/services.dart';
import 'package:elangsung_test_mobile/shared/constanta.dart';
import 'package:elangsung_test_mobile/widget/button_half_outline_widget.dart';
import 'package:elangsung_test_mobile/widget/button_half_widger.dart';
import 'package:elangsung_test_mobile/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginRequestModel requestModel;

  bool _isHidden = true;
  bool _isSelected = false;

  bool isUsername = false;
  bool isPass = false;
  bool isLogin = false;
  String username = '';
  String password = '';
  String message = '';

  @override
  void initState() {
    super.initState();
    _begin();
    requestModel = new LoginRequestModel(username: username, password: password);
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
                      "Login",
                      style: TextStyle(
                        color: cEigthGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Silahkan login untuk masuk aplikasi",
                      style: TextStyle(
                        color: cEigthGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
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
                        onSaved: (input) => requestModel.username = usernameController.text,
                        controller: usernameController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person, color: cThreedGrey,),
                          hintText: "username",
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
                          hintText: "password",
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
                text: "Login",
                colorback: cPrimaryOrange,
                press: () {
                  if (validateAndSave()) {
                    setState(() {
                      isLogin = true;
                    });
                    LoginServices loginServices = new LoginServices();
                    loginServices.login(requestModel).then(
                      (value) {
                        if (value.status == true) {
                          FlutterSecureStorage secureStorage = new FlutterSecureStorage();
                          secureStorage.write(
                            key: 'token',
                            value: value.data.token
                          );
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
              SizedBox(height: 17),
              ButtonHalfOutlineWidget(
                text: "Register",
                press: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: RegisterScreen(),
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

  _begin() async {
    final _storage = FlutterSecureStorage();
    String username = await _storage.read(key: 'username');
    if (username != null) {
      setState(() {
        usernameController = TextEditingController(text: username);
        _isSelected = true;
      });
    }
  }
}