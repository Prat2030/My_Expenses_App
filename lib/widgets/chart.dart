// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import './chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions, void Function(String id) deleteTransaction);

  List<Map<String, dynamic>> get groupedTransactionvalues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        // First understand the logic for this code (given below)
        Duration(days: index),
      );
//  Here we have 2 things one is recentTransactions and other is
//  groupedTransactionvalues. groupedTransactionvalues is a list of map
//  and recentTransactions is a list of transaction that had happende earlier.
//  So we are creating a map with key as weekDay and value as the sum of money
//  of all the transactions of that week.

//  Suppose we land on any particluar day of the week and then when we want to access it
//  then we will subtract the weekDay from the current date and then we will get the
//  weekDay.

      double totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year)
        // Here we are checking that whether the date of the transaction is same as the weekDay
        {
          totalSum += recentTransactions[i].money;
        }
      }

      // print(DateFormat.E().format(weekDay));
      // print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
      // Here DateFormat is provided with the intl package where E is the day of the week.
      // 0 --> Monday, 1 --> Tuesday, 2 --> Wednesday, 3 --> Thursday and similarly rest all.
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionvalues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionvalues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionvalues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data['day'],
                  data['amount'],
                  // (data['amount'] as double) / totalSpending,
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending,
                ),
              );
            }).toList()),
      ),
    );
  }
}
