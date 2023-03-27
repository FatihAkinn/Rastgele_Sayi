import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Number List Demo',
      home: RandomNumberList(),
    );
  }
}

class RandomNumberList extends StatefulWidget {
  @override
  _RandomNumberListState createState() => _RandomNumberListState();
}

class _RandomNumberListState extends State<RandomNumberList> {
  int randomNumber = Random().nextInt(100);

  List<int> numberList = [];

  @override
  void initState() {
    super.initState();
    generateRandomNumberList();
  }
//Rastgele Sayıyı Üreten Kısım
  void generateRandomNumberList() {
    numberList.clear();
    for (int i = 0; i < 10; i++) {
      int randomNumber = Random().nextInt(100);
      numberList.add(randomNumber);
    }
  }
//Text'e Bastığımızda Random Sayıların Gelmesini Sağlayan Kısım
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Rastgele Sayı Üretme'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                generateRandomNumberList();
                randomNumber = Random().nextInt(100);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Rastgele Üret".toString(),
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: numberList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(numberList[index].toString()),
                  onTap: () {
                    setState(() {
                      numberList.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}