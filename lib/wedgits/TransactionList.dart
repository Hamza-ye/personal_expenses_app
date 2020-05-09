
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
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(
                        child: Text('\$${transactions[index].amount}')
                    ),
                  ),
                ),
                title: Text('${transactions[index].title}',
                  style: Theme.of(context).textTheme.title,),
                subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              ),
            );
          },
        itemCount: transactions.length,
      ),
    );
  }
}
