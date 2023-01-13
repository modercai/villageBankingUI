// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:villagebankingui/utilities/depositui.dart';

class CashDeposit extends StatefulWidget {
  CashDeposit({Key? key}) : super(key: key);

  @override
  _CashDepositState createState() => _CashDepositState();
}

class _CashDepositState extends State<CashDeposit> {
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
            Row(
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
