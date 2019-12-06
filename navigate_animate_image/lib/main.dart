import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing"),
      ),
/*
      body: RaisedButton(
        child: Text("Tap me?"),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen())),
      ),
*/
      body: GestureDetector(
        child: Hero(
          tag: 'myimage',
          child: Image.network('https://images.unsplash.com/photo-1514242879996-d7b3bb2dd531?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen())),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      appBar: AppBar(
        title: Text("SecondScreen"),
      ),
*/
/*
      body: RaisedButton(
        child: Text("Tap me?"),
        onPressed: () => Navigator.pop(context)
      ),
*/
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'myimage',
            child: Image.network('https://images.unsplash.com/photo-1514242879996-d7b3bb2dd531?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
          ),
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}