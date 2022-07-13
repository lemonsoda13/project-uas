import 'dart:convert';

import 'package:diary_cuan/api/model/usermodel.dart';
import 'package:diary_cuan/api/service/services.dart';
import 'package:diary_cuan/homePage.dart';
import 'package:diary_cuan/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as client;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late UserApiService userApiService;
  bool loginState = false;

  @override
  void initState() {
    userApiService = UserApiService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset("images/login.png"),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(18),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xff332FD0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 18, left: 18),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key, color: Color(0xff332FD0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          GestureDetector(
            onTap: () {
              doLogin();
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(18),
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xff332FD0),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Register();
              }));
            },
            child: Container(
              margin: EdgeInsets.only(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    " Register",
                    style: GoogleFonts.poppins(color: Color(0xff332FD0)),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    ));
  }

  doLogin() async {
    try {
      final response = await client.post(
          Uri.parse(
              "https://financialmanagement.lemonsoda.my.id/public/authentication"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({"email": email.text, "password": password.text}));
      final output = jsonDecode(response.body);
      if (output['logged_in'] == true) {
        loginState = true;
        goHome();
        print(loginState);
      } else {
        print(output['logged_in']);
      }

      print(output);
    } catch (e) {
      print('$e');
    }
  }

  void goHome() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
