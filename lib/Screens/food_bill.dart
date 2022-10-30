import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodBill extends StatelessWidget {
  double totalBill;
  FoodBill({super.key, required this.totalBill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Total Bill"),),
      body: Center(
        child: Text("Your total bill is $totalBill"),
      ),
    );
  }
}

