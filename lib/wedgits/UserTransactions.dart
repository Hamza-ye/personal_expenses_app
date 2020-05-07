import 'package:flutter/material.dart';
import 'package:personalexpensesapp/models/Transaction.dart';

import 'NewTransaction.dart';
import 'TransactionList.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '001', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String axTitle, double axAmount) {
    final newTx = Transaction(
        title: axTitle,
        amount: axAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
