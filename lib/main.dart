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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),  
      ),
      body: Column(
        
        
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
        Card(
          child: Text('Lists of texts'),
        )
      ],
      ),
    );
  }
}