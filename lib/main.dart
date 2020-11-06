import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _text = <String>[];

  void _incrementCounter([int delta = 1]) {
    setState(() {
      if (delta > 0 && _counter < 33) {
        _counter++;
        var txt = '$_counter';
        txt = _counter % 3 == 0 ? "face" : txt;
        txt = _counter % 5 == 0 ? "book" : txt;
        txt = _counter % 15 == 0 ? "facebokk" : txt;
        _text.add(txt);
      }
      if (delta < 0 && _counter > 0) {
        _counter--;
        _text.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              RaisedButton(
                onPressed: (() => _incrementCounter(1)),
                child: Text('+1'),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              RaisedButton(
                onPressed: (() => _incrementCounter(-1)),
                child: Text('-1'),
              ),
            ]),
            Expanded(
              child: GridView.builder(
                itemCount: _text.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 5 : 8),
                itemBuilder: (BuildContext context, int index) {
                  return MiBaldosa(text: _text, index: index);
                },
              ),
            )
          ],
        ),
      ),
      // akes auto-formatting nicer for build methods.
    );
  }
}

class MiBaldosa extends StatelessWidget {
  const MiBaldosa({
    Key key,
    @required List<String> text,
    @required int index,
  })  : _text = text,
        _index = index,
        super(key: key);

  final List<String> _text;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: Text(_text[_index]), //just for testing, will fill with image later
    ));
  }
}
