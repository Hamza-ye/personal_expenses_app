
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpensesapp/models/Transaction.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      '\$${transactions[index].amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2)),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        DateFormat().format(transactions[index].date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              ),
            );
          },
        itemCount: transactions.length,
      ),
    );
  }
}
