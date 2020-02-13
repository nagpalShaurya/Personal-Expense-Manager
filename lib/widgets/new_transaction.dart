import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titlecontroller = TextEditingController();
DateTime _selectedDate;
  final _amountcontroller = TextEditingController();

void _submitData()
{
  if(_amountcontroller.text.isEmpty)
  {
    return;
  }
  final enteredTitle = _titlecontroller.text;
  final enteredAmount = double.parse(_amountcontroller.text);
  

  if(enteredTitle.isEmpty || enteredAmount<=0 || _selectedDate == null) {
    return;
  }
    widget.addTx(
        _titlecontroller.text,
        double.parse(_amountcontroller.text),
        _selectedDate,
    );
    Navigator.of(context).pop();
  
}

void _presentDatePicker() {
  showDatePicker(
    context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime(2019), 
    lastDate: DateTime.now()
  ).then((pickedDate) {
    if(pickedDate == null)
    {
      return;
    }
    setState(() {
    _selectedDate = pickedDate;  
    });
    
  });
}
  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 7,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField( 
                  decoration: InputDecoration(labelText: 'Title',
                  ),
                  // onChanged: (value) {
                  //   titleInput = value;
                  // },
                  onSubmitted:(_) => _submitData(),
                  controller: _titlecontroller,
                  ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  onSubmitted:(_) => _submitData(),
                  // onChanged: (value) {
                  //   amountInput = value;
                  // },                  
                  controller: _amountcontroller,
                  ),

                  Container(
                    height: 85,
                    child: Row(children: <Widget>[
                      Expanded(child: Text(_selectedDate == null?'No Date Chosen!': 'date chosen: '+DateFormat.yMd().format(_selectedDate))),
                      FlatButton(
                        textColor: Colors.redAccent,
                        onPressed: _presentDatePicker, 
                        child:Text('Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ),
                    ],),
                  ),

                  RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () => _submitData(), 
                    child: Text('Add Transaction'))
              ],
        ),
          ),
        );
  }
}