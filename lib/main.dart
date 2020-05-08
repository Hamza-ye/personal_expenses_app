import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personalexpensesapp/wedgits/NewTransaction.dart';
import 'package:personalexpensesapp/wedgits/TransactionList.dart';

import 'models/Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
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
    Transaction(
        id: '001', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: '002', title: 'New Shoes1', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: '003', title: 'New Shoes2', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: '004', title: 'New Shoes3', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: '005', title: 'New Shoes4', amount: 69.99, date: DateTime.now()),
  ];

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
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
            color: Colors.cyanAccent,
            child: Card(
              child: Text('Chart card'),
            ),
          ),
          TransactionList(_userTransactions),
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
