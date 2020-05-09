import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personalexpensesapp/wedgits/Chart.dart';
import 'package:personalexpensesapp/wedgits/NewTransaction.dart';
import 'package:personalexpensesapp/wedgits/TransactionList.dart';

import 'models/Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          button: TextStyle(color: Colors.white,),
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
//    Transaction(
//        id: '001', title: 'New Shoes', amount: 10.00, date: DateTime.now()),
//    Transaction(
//        id: '002', title: 'Groceries', amount: 30.00, date: DateTime.now()),
//    Transaction(
//        id: '003', title: 'Taxi', amount: 9.11, date: DateTime.now()),
//    Transaction(
//        id: '004', title: 'New Shirt', amount: 10.00, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),)
      );
    }).toList();
  }
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _addNewTransaction(String axTitle, double axAmount, DateTime date) {
    final newTx = Transaction(
        title: axTitle,
        amount: axAmount,
        date: date,
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Chart(_recentTransactions),
          ),
          TransactionList(_userTransactions, _deleteTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
