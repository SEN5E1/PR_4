import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  String dropdownValue = list.first;

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = list.first;

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  int _counter = 0;

  get count => null;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Text('Меню')),
        backgroundColor: Colors.white10,
        leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Increase volumeby 10',
            onPressed: () {
              setState(() {});
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _incrementCounter();
              },
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              style: style,
              onPressed: () => {_incrementCounter()},
              child: Container(child: new Text('Нажми, +1')),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Received click');
              },
              child: GestureDetector(
                onTap: () {
                  const snackBar = SnackBar(content: Text('Tap'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  child: const Text('Нажми меня!'),
                  color: Colors.amber[600],
                  width: 48.0,
                  height: 48.0,
                ),
              ),
            ),
            ElevatedButton(
              child: Container(child: const Text('Banner')),
              onPressed: () => ScaffoldMessenger.of(context).showMaterialBanner(
                const MaterialBanner(
                  padding: EdgeInsets.all(20),
                  content: Text('Hello, I am a Material Banner'),
                  leading: Icon(Icons.agriculture_outlined),
                  backgroundColor: Colors.brown,
                  actions: <Widget>[
                    TextButton(
                      onPressed: null,
                      child: Text('DISMISS'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
