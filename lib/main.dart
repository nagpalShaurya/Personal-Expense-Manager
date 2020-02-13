import 'package:expense_manager/widgets/new_transaction.dart';

import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontFamily: 'OpenSans',fontSize: 20,fontWeight: FontWeight.bold)),)
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // final titlecontroller = TextEditingController();
  // final amountcontroller = TextEditingController();


final List<Transaction> _userTransactions = [
    //   Transaction (
    //   id: 't1', 
    //   amount: 105.00, 
    //   title: 'Food Expenses', 
    //   date: DateTime.now()
    //   ),

    // Transaction (
    //   id: 't2', 
    //   amount: 250.00, 
    //   title: 'Groceries', 
    //   date: DateTime.now()
    //   ),      
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days:7),
          ),
        );
    }).toList();
  }

 void _addNewTransaction(String title, double amount, DateTime chosenDate) {
   final newTX = Transaction(
     id: DateTime.now().toString(), 
     title: title, 
     amount: amount, 
     date: chosenDate,
     );

     setState(() {
       _userTransactions.add(newTX);
     });
 }

 void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx){
        return tx.id == id;
      });
    });
 }
void _startAddNewTransaction(BuildContext ctx) {
  showModalBottomSheet(context: ctx, builder: (_) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: NewTransaction(_addNewTransaction),
    );  
  },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),  
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>_startAddNewTransaction(context),
          ),
        ],
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
              child: Column(
          
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
          Chart(_recentTransactions),

          TransactionList(_userTransactions,_deleteTransaction)

        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}