import 'package:flutter/material.dart';

//Source:
//https://flutter.dev/docs/cookbook/navigation/navigation-basics

void main1()
{
  runApp(
    MaterialApp(
      home: FirstRoute(),
    ),
  );
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key key}) : super(key: key);

  Widget myfn(BuildContext context) {
    return SecondRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => print("menu pressed"),
          icon: Icon(Icons.menu),
        ),
        title: Text("First Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Open route"),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: myfn)),
//          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute())),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Go Back"),
        ),
      ),
    );
  }
}


void main()
{
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstNamedRoute(),
        '/SecondPage': (context) => SecondNamedRoute(),
      },
    ),
  );
}

class FirstNamedRoute extends StatelessWidget {
  const FirstNamedRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => print("menu pressed"),
          icon: Icon(Icons.menu),
        ),
        title: Text("First Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Open route1"),
          onPressed: () => Navigator.pushNamed(context, '/SecondPage'),
        ),
      ),
    );

  }
}

class SecondNamedRoute extends StatelessWidget {
  const SecondNamedRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Go Back2"),
        ),
      ),
    );
  }
}