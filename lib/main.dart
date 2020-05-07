import 'package:flutter/material.dart';
import './Transaction.dart';
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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: '001',
        title: 'New Shoes',
        amount: 69.99,
        date: DateTime.now()),
    Transaction(
        id: 't1',
        title: 'Weekly Groceries',
        amount: 16.35,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'New Shoes 2',
        amount: 69.99,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New Shoes 3',
        amount: 69.99,
        date: DateTime.now()),
    Transaction(
        id: 't4',
        title: 'New Shoes 4',
        amount: 69.99,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
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
          Column(
            children: transactions.map((tx) {
              return Row(
                children: <Widget>[
                  Container(
                    child: Text(tx.amount.toString(),),
                  ),
                  Column(
                    children: <Widget>[
                      Text(tx.title,),
                      Text(tx.date.toString(),),
                    ],
                  )
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
