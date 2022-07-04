import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/diarycuan.png'),
              fit: BoxFit.cover
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
