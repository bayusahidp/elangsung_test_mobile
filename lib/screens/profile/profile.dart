// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, missing_return, avoid_single_cascade_in_expression_statements, unnecessary_new, prefer_if_null_operators

import 'package:elangsung_test_mobile/bloc/blocs.dart';
import 'package:elangsung_test_mobile/models/models.dart';
import 'package:elangsung_test_mobile/screens/login/login.dart';
import 'package:elangsung_test_mobile/screens/profile/change_password.dart';
import 'package:elangsung_test_mobile/services/services.dart';
import 'package:elangsung_test_mobile/shared/constanta.dart';
import 'package:elangsung_test_mobile/widget/avatar_oval_widget.dart';
import 'package:elangsung_test_mobile/widget/button_half_outline_widget.dart';
import 'package:elangsung_test_mobile/widget/button_half_widger.dart';
import 'package:elangsung_test_mobile/widget/error_message_to_login.dart';
import 'package:elangsung_test_mobile/widget/refresh_widget.dart';
import 'package:elangsung_test_mobile/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  AsyncSnapshot<ProfileResponseModel> snapshotStorage;

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fakultasController = TextEditingController();
  TextEditingController jurusanController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  ProfileUpdateRequestModel requestModel;

  bool isLoading = false;

  bool isUsername = false;
  bool isPass = false;

  String imgurl = 'wrong';
  String name = '';
  String username = '';
  String email = '';
  String fakultas = '';
  String jurusan = '';
  String alamat = '';

  Future onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      profileBloc.fetchDataProfile();
    });
  }

  @override
  void initState() {
    super.initState();
    profileBloc.fetchDataProfile();
    requestModel = new ProfileUpdateRequestModel(
      name: name,
      email: email,
      username: username,
      fakultas: fakultas,
      jurusan: jurusan,
      alamat: alamat,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(cPrimaryOrange)
          ),
        )
      );
    }
    return StreamBuilder(
      stream: profileBloc.dataProfile,
      builder: (context, AsyncSnapshot<ProfileResponseModel> snapshot) {
        // print(snapshot.data);
        if (snapshot.hasData) {
          if (snapshot.data.status == true) {
            return RefreshWidget(
              onRefresh: onRefresh,
              child: buildPage(snapshot)
            );
          }
          else {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                ShowDialogError.showDialogErrorToLogin(snapshot.data.message, context);
              }
            );
          }
        }
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(cPrimaryOrange)
            ),
          )
        );
      }
    );
  }

  Widget buildPage(AsyncSnapshot<ProfileResponseModel> snapshot) {
    nameController = TextEditingController(text: snapshot.data.data.name);
    usernameController = TextEditingController(text: snapshot.data.data.username);
    emailController = TextEditingController(text: snapshot.data.data.email);
    fakultasController = TextEditingController(text: snapshot.data.data.fakultas);
    jurusanController = TextEditingController(text: snapshot.data.data.jurusan);
    alamatController = TextEditingController(text: snapshot.data.data.alamat);

    name = snapshot.data.data.name;
    username = snapshot.data.data.username;
    email = snapshot.data.data.email;
    fakultas = snapshot.data.data.fakultas;
    jurusan = snapshot.data.data.jurusan;
    alamat = snapshot.data.data.alamat;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cPrimaryOrange,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  // ignore: deprecated_member_use
                  overflow: Overflow.visible,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 140,
                      width: size.width,
                      color: cPrimaryOrange,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Column(
                            children: [
                              AvatarOval(
                                imageUrl: snapshot.data.data.foto != null ? snapshot.data.data.foto : imgurl,
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
                        onSaved: (input) => requestModel.name = nameController.text,
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
                        onSaved: (input) => requestModel.alamat = alamatController.text,
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
              SizedBox(height: 10),
              ButtonHalfWidget(
                text: "Save",
                colorback: cPrimaryOrange,
                press: () {
                  if (validateAndSave()) {
                    setState(() {
                      isLoading = true;
                    });
                    ProfileServices profileServices = new ProfileServices();
                    profileServices.updateProfile(requestModel).then(
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
              SizedBox(height: 10),
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
              SizedBox(height: 10),
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
        ],
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
}