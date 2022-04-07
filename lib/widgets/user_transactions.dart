// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_new

import './new_transaction.dart';
import './transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(
          _userTransactionList,
        )
      ],
    );
  }
}
