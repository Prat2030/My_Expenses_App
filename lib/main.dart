// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_unnecessary_containers, unused_import, unused_element, unnecessary_new

// import './widgets/new_transaction.dart';

import './widgets/user_transactions.dart';
import 'models/transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanses_App',
      home: MyHomePage(
        title: 'My Expenses App',
      ),
    );
  }
}

void startAddNewTransaction(BuildContext ctx) {
  showModalBottomSheet(
    context: ctx,
    builder: (_) {
      return NewTransaction();
    },
  );
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final List<Transaction> transaction = [];

  final List<Transaction> _userTransactionList = [
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

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = new Transaction(
        title: txTitle,
        money: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactionList.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses App'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          UserTransactions()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
