// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import './transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanses_App',
      home: MyHomePage(
        title: 'My Expanses App',
      ),
    );
  }
}≥

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      money: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      money: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expanses App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Container(
                width: double.infinity,
                child: Text('CHART!'),
              ),
              elevation: 5,
            ),
          ),
          Column(
            children: transaction.map((tx) {
              return Card(child: Text(tx.title));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
f