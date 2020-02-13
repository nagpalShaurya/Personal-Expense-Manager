import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addTx;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  NewTransaction(this.addTx);

void submitData()
{
  final enteredTitle = titlecontroller.text;
  final enteredAmount = double.parse(amountcontroller.text);

  if(enteredTitle.isEmpty || enteredAmount<=0) {
    return;
  }
    addTx(
        titlecontroller.text,
        double.parse(amountcontroller.text)
    );
  
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
                  onSubmitted:(_) => submitData(),
                  controller: titlecontroller,
                  ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  onSubmitted:(_) => submitData(),
                  // onChanged: (value) {
                  //   amountInput = value;
                  // },                  
                  controller: amountcontroller,
                  ),

                  FlatButton(
                    textColor: Colors.purple,
                    onPressed: () => submitData(), 
                    child: Text('Add Transaction'))
              ],
        ),
          ),
        );
  }
}