import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;


void main()
{
  runApp(
    MaterialApp(
      title: "Hello",
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _width = 50;
  double _height = 100;
  Color _color = Colors.greenAccent;
  BorderRadiusGeometry _border = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _border,
          ),
          curve: Curves.fastOutSlowIn,
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _border = BorderRadius.circular(random.nextInt(100).toDouble());
            _color = Color.fromRGBO(
              random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
              
          });
        },
      ),
    );
  }
}