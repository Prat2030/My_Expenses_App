// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void SubmitData() {
    final EnteredTitle = titleController.text;
    final EnteredAmount = double.parse(amountController.text);

    if (EnteredTitle.isEmpty || EnteredAmount <= 0) {
      return;
    }

    widget.addTx(EnteredTitle, EnteredAmount);

    Navigator.of(context).pop();
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
