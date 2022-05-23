// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_string_escapes

import './transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  // TransactionList(List<Transaction> userTransactionList, {required this.transactions});
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Image.asset('assets/images/waiting.png'),
                //Here if we don't add the Container to the image
                // Then image gets out of the sized as the parent container has size of 300 only.
              ],
            );
          }))
        : ListView.builder(
            itemBuilder: ((context, index) {
              return TransactionItem(
                  transaction: transactions[index], deleteTx: deleteTx);
            }),
            itemCount: transactions.length,
          );
  }
}
