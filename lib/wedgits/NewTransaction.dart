import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;
  NewTransaction(this.addTransaction);
  void submitData() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);
    if(title.isEmpty || amount <= 0) {
      return;
    }
    addTransaction(titleController.text, double.parse(amountController.text));
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_)=> submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            onSubmitted: (_)=> submitData(),
            keyboardType: TextInputType.number,
          ),
          FlatButton(
            child: Text('Add Transaction'),
            textColor: Colors.purple,
            onPressed: submitData,
          )
        ],
      ),
    );
  }
}
