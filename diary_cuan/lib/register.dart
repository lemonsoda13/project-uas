import 'package:diary_cuan/api/model/usermodel.dart';
import 'package:diary_cuan/api/service/services.dart';
import 'package:diary_cuan/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homePage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late UserApiService userApiService;

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
              Image.asset("images/register.png"),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xff332FD0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(18),
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xff332FD0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 18, right: 18, bottom: 18),
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
            margin: EdgeInsets.only(
              left: 18,
              right: 18,
            ),
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
              register();
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
                'Register',
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
              ),
            ),
          )
        ],
      )),
    ));
  }

  register() {
    UserModel userModel = UserModel(
        id_user: 'id_user',
        email: 'email',
        password: 'password',
        username: 'username');

    userModel.email = email.text;
    userModel.username = username.text;
    userModel.password = password.text;

    userApiService.createUser(userModel).then((value) => goLogin());
  }

  goLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Login()));
  }
}
