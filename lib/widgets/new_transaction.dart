// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  late DateTime _selectedDate;

  void _SubmitData() {
    final EnteredTitle = _titleController.text;
    final EnteredAmount = double.parse(_amountController.text);

    if (EnteredTitle.isEmpty || EnteredAmount <= 0) {
      return;
    }

    widget.addTx(EnteredTitle, EnteredAmount);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            controller: _titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _SubmitData,
            controller: _amountController,
          ),
          Container(
            height: 80,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}'),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _presentDatePicker,
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text('Add Transaction'),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button?.color,
            onPressed: _SubmitData,
          ),
        ],
      ),
    ));
  }
}
