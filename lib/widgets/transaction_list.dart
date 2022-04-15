// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_string_escapes

import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  // TransactionList(List<Transaction> userTransactionList, {required this.transactions});
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Image.asset('assets/images/waiting.png'),
                //Here if we don't add the Container to the image
                // Then image gets out of the sized as the parent container has size of 300 only.
              ],
            )
          : ListView.builder(
              itemBuilder: ((context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\₹ ${transactions[index].money.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 63, 63, 60),
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            // tx.date.toString(),
                            DateFormat.yMMMMd()
                                .format(transactions[index].date),
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              itemCount: transactions.length,
            ),
    );
  }
}
