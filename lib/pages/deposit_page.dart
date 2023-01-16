// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:villagebankingui/utilities/depositui.dart';

class CashDeposit extends StatefulWidget {
  CashDeposit({Key? key}) : super(key: key);

  @override
  _CashDepositState createState() => _CashDepositState();
}

class _CashDepositState extends State<CashDeposit> {
  //text controller for grabbing user input
  bool _isIncome = false;
  final _textcontrollerAMOUNT = TextEditingController();
  final _textcontrollerPHONENUMBER = TextEditingController();
  final _textcontrollerITEM = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //bring up the dialog box for the transactions
  void _newTransaction() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: Text('N E W  T R A N S A C T I O N'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Deposit'),
                          Switch(
                            value: _isIncome,
                            onChanged: (newValue) {
                              setState(() {
                                _isIncome = newValue;
                              });
                            },
                          ),
                          Text('Withdraw'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Amount?',
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter an amount';
                                  }
                                  return null;
                                },
                                controller: _textcontrollerAMOUNT,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Number?',
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter Number';
                                  }
                                  return null;
                                },
                                controller: _textcontrollerPHONENUMBER,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Description',
                              ),
                              controller: _textcontrollerITEM,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.grey[600],
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: Colors.grey[600],
                    child: Text('Enter', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //_enterTransaction();
                        Navigator.of(context)
                            .pop(); //here put reload and take toa new page to show the new balance
                      }
                    },
                  )
                ],
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Deposit Cash'),
        backgroundColor: Colors.grey.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Deposit',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  ' Money',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Choose Your Payment Method:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black,
            ),
            Text(
              'Mobile Transfer',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: _newTransaction,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DepositUI(
                      depositIconPath: 'lib/icons/mtn-logo.png',
                      depositbottomText: 'MTN'),
                  DepositUI(
                      depositIconPath: 'lib/icons/airtel.png',
                      depositbottomText: 'Airtel'),
                  DepositUI(
                      depositIconPath: 'lib/icons/zamtel.png',
                      depositbottomText: 'Zamtel'),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Bank Transfer',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  DepositUI(
                      depositIconPath: 'lib/icons/paypal.png',
                      depositbottomText: 'Paypal'),
                  SizedBox(
                    height: 20,
                  ),
                  DepositUI(
                      depositIconPath: 'lib/icons/debit-card.png',
                      depositbottomText: 'Card Payments'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
