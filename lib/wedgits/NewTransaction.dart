import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    String title = _titleController.text;
    double amount = double.parse(_amountController.text);
    if(title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTransaction(
        _titleController.text,
        double.parse(_amountController.text), _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_)=> _submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            onSubmitted: (_)=> _submitData(),
            keyboardType: TextInputType.number,
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(_selectedDate == null ?'No date chosen!': DateFormat.yMd().format(_selectedDate))
                ),
                FlatButton(
                  child: Text('Choose a date'),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _presentDatePicker,
                )
              ],
            ),
          ),
          RaisedButton(
            child: Text('Add Transaction'),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
            onPressed: _submitData,
          ),
        ],
      ),
    );
  }
}
