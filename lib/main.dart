import './widgets/user_transactions.dart';
import 'package:flutter/material.dart';


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


  // String titleInput;
  // String amountInput;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),  
        backgroundColor: Colors.redAccent,
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
            color: Colors.redAccent,
            elevation:5,
            child: Text('CHARTS!',style: TextStyle(color: Colors.white),),           //method 2 to do the same....
          ),
        ),

        UserTransactions()

      ],
      ),
    );
  }
}