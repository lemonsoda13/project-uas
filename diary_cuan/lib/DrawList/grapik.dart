import 'package:flutter/material.dart';

class Graphic extends StatelessWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grafik"),),
      body: Center(
        child: Text('grapik'),
      ),
    );
  }
}
