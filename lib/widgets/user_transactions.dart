import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
final List<Transaction> _userTransactions = [
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

 void _addNewTransaction(String title, double amount) {
   final newTX = Transaction(
     id: DateTime.now().toString(), 
     title: title, 
     amount: amount, 
     date: DateTime.now()
     );

     setState(() {
       _userTransactions.add(newTX);
     });
 }
  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
         NewTransaction(_addNewTransaction),
         TransactionList(_userTransactions)        
      ],      
    );
  }
}