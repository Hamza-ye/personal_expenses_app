import 'package:flutter/material.dart';
import 'package:personalexpensesapp/models/Transaction.dart';
import 'package:intl/intl.dart';
import 'package:personalexpensesapp/wedgits/ChartBar.dart';
class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      double totalSum = 0;
      for (var transaction in recentTransactions) {
        if(transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay).substring(0, 1), 'amount': totalSum};
    });
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum += item['amount'];
    });
  }
  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactions.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                data['day'],
                data['amount'],
                totalSpending>0.0? (data['amount'] as double)/totalSpending : 0.0),
          );
        }).toList(),
      ),
    );
  }
}
