import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

void main()
{
  runApp(
    MaterialApp(
      title: "My First Flutter App",
      theme: ThemeData.light(),
//      home: MyApp2(),
//      home: handle_gesture(),
//      home: TestStatefulWidget(),
      home: CounterClass(),
    ),
  );
}
/*
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title // could not understand this
            ),
          ),
          Expanded(
            child: Center(
              child: Text("Hello World!!"),
            )
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: () => print("menu pressed"),
            ),
            Expanded(
              child: title,
            ),
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => print("search pressed"),
            ),
          ],
        ),
      ),
    );
  }
}
*/


class MyApp1 extends StatelessWidget {

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Scaffold: Test'),
    ),
    body: Builder(
      builder: (context) =>
      Center(
        child: RaisedButton(
          color: Colors.pink,
          textColor: Colors.white,
          onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text("hack a kitkat"))),
        )
      )
    ),
  );
}
}


class MyApp  extends StatelessWidget {
  MyApp ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => print("Hello"),
        ),
        title: const Text ("Example App Bar"),
        actions: <Widget>[
         IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () => print ("alert pressed"),
          ),
        ],
      ),
      body: Center(
        child: Container(
        //color: Theme.of(context).accentColor, -> this will make the container background with blue
        child: Text(
          "Hello world",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      ),
    );
  }
}

class MyApp2  extends StatelessWidget {
  MyApp2 ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("Hellllllo"),
      ),
      body: Builder(
        builder: (context) =>
          Center(
            child: FloatingActionButton(
              onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text("hehe"))),
              child: Icon(Icons.add),
            ),
          ),
      ),
    );
  }
}


class handle_gesture extends StatelessWidget {
  const handle_gesture({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("gesture button pressed"),
      child: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text("Engage"),
        ),
      ),
    );
  }
}


class TestStatefulWidget extends StatefulWidget {
  TestStatefulWidget({Key key}) : super(key: key);

  @override
  _TestStatefulWidgetState createState() => _TestStatefulWidgetState();
}

class _TestStatefulWidgetState extends State<TestStatefulWidget> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => print("menu pressed"),
        ),
        title: IconButton(
          iconSize: 100,
          icon: Text("Hello Hello"),
          onPressed: () => print("hello pressed"),
        ),
//        title: GestureDetector(
//          child: Text("Hello There"),
          //onTap: () => print("title pressed"),
//        ),
//        title: Text("hello"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () => print("mic pressed"),
          ),
        ],
      ),
    );
  }
} 


class CounterDisplay extends StatelessWidget {
  const CounterDisplay ({this.count1});

  final int count1;
  @override
  Widget build(BuildContext context) {
    return Text("Counter = $count1");
  }
}

class CounterIncr extends StatelessWidget {
  CounterIncr({this.onPressed});

  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text("++"),
    );
  }
}

class CounterClass extends StatefulWidget {
  CounterClass({Key key}) : super(key: key);

  @override
  _CounterClassState createState() => _CounterClassState();
}

class _CounterClassState extends State<CounterClass> {
  int _count = 0;
  void _increment() {
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CounterIncr(onPressed: _increment),
        CounterDisplay(count1: _count),
      ],
    );
  }
}