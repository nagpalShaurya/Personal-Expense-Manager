import 'package:expense_manager/transaction.dart';
import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions = [

    Transaction (
      id: 't1', 
      amount: 105.00, 
      title: 'Food Expenses', 
      date: DateTime.now()
      ),

    Transaction (
      id: 't2', 
      amount: 250.00, 
      title: 'Groceries', 
      date: DateTime.now()
      ),      
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),  
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget> [
        // Card(
        //   child: Container(
        //     color: Colors.amber,
        //     width: double.infinity,        //method 1....
        //     child: Text('Chart')),
        //   elevation: 5,
        // ),
        Container(
          width:double.infinity,
          child: Card(
            color: Colors.amber,
            elevation:100,
            child: Text('CHARTS!'),           //method 2 to do the same....
          ),
        ),
        Column(children: transactions.map((tx) {
          return Card (
            child: Row(children: <Widget>[
                  Container (
                    margin: EdgeInsets.symmetric(
                      vertical:10, 
                      horizontal: 15,
                      ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width:2,
                        ),
                      ),
                    padding: EdgeInsets.all(10),
                    child: Text(tx.amount.toString(),
                    ),
                    ),
                  Column(children: <Widget>[
                    Text(tx.title),
                    Text(tx.date.toString(),),
                  ],),   
            ],),
            );
        }).toList()),
      ],
      ),
    );
  }
}