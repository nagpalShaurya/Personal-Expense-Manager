import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
final List<Transaction> trans;

TransactionList(this.trans);

 @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx,index) {
          return Card (
                elevation: 4,
                child: Row(children: <Widget>[
                      Container (
                        margin: EdgeInsets.symmetric(
                          vertical:10, 
                          horizontal: 15,
                          ),
                        decoration: BoxDecoration(
                            border: Border.all(
                            color: Colors.purple,
                            width:2,
                            ),
                          ),
                        padding: EdgeInsets.all(10),
                        child: Text('₹  ' + NumberFormat('#,###.00').format(trans[index].amount),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                          ),
                        ),
                        ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text(
                          trans[index].title, 
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        Text(
                          DateFormat('dd/MM/yyyy').add_jm().format(trans[index].date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                      ),   
                ],),
                );
        },
        itemCount: trans.length,
  ),
    );
  }
}