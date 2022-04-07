// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void SubmitData() {
    final EnteredTitle = titleController.text;
    final EnteredAmount = double.parse(amountController.text);

    if (EnteredTitle.isEmpty || EnteredAmount <= 0) {
      return;
    }

    addTx(EnteredTitle, EnteredAmount);
  }

  // NewTransaction(void Function(String txTitle, double txAmount) addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            // onChanged: (value) {
            //   titleInput = value;
            // },
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => SubmitData,
            controller: amountController,
          ),
          FlatButton(
            child: Text('Add Transaction'),
            textColor: Colors.purple,
            onPressed: SubmitData,
          ),
        ],
      ),
    ));
  }
}
