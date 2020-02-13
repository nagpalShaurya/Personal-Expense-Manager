import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addTx;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  NewTransaction(this.addTx);

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
                  controller: titlecontroller,
                  ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  // onChanged: (value) {
                  //   amountInput = value;
                  // },                  
                  controller: amountcontroller,
                  ),

                  FlatButton(
                    textColor: Colors.purple,
                    onPressed: (){
                      addTx(
                        titlecontroller.text,
                        double.parse(amountcontroller.text)
                        );
                    }, 
                    child: Text('Add Transaction'))
              ],
        ),
          ),
        );
  }
}