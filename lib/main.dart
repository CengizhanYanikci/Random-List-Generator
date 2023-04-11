import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RandomListApp',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const ListRandomPage(title: 'Random List App'),
    );
  }
}

class ListRandomPage extends StatefulWidget {
  const ListRandomPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ListRandomPage> createState() => _ListRandomPageState();
}

class _ListRandomPageState extends State<ListRandomPage> {
  List<int> randomList = [];

  void _createRandomList() {
    setState(() {
      randomList.clear();
      for (int i = 0; i < 10; i++) {
        int randomNumber = Random().nextInt(100); // Rastgele sayı üretme
        randomList.add(randomNumber);
      }
    });
  }

  void _removeFromList(int index) {
    setState(() {
      randomList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: randomList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    '${randomList[index]}',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => _removeFromList(index),
                  hoverColor: Colors.red.shade900.withOpacity(1),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 35),
            child: ElevatedButton(
              onPressed: _createRandomList,
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 11, 8, 207)),
              child: const Text('Generate List'),
            ),
          )
        ],
      ),
    );
  }
}