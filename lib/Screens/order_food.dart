import 'package:flutter/material.dart';
import 'package:food_order/Screens/food_bill.dart';
import '../Models/food_item.dart';

class OrderFood extends StatefulWidget {
  List<FoodItem> fItemList = [];
  OrderFood({super.key, required this.fItemList});

  @override
  State<OrderFood> createState() => _OrderFoodState();
}

class _OrderFoodState extends State<OrderFood> {
  double calculateTax(double bill) {
    bill = (bill * 0.15) + bill;
    return bill;
  }

  List<FoodItem> fItemList = [];
  double totalPrice = 0;
  String gVal = "none";
  @override
  void initState() {
    fItemList = widget.fItemList;
    print("List Size : ${fItemList.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Order Food"),),
      body: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: fItemList.length,
            itemBuilder: (context, index) {
              FoodItem fItem = fItemList[index];
              return CheckboxListTile(
                  title: Text(fItem.itemName),
                  value: fItem.isSelected,
                  onChanged: (v) {
                    v == true
                        ? totalPrice += fItem.itemPrice
                        : totalPrice -= fItem.itemPrice;
                    setState(() {
                      fItem.isSelected = v!;
                    });
                  });
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          RadioListTile(
              title: const Text("Add 15% Tax"),
              value: "True",
              groupValue: gVal,
              onChanged: (o) {
                setState(() {
                  gVal = o!;
                });
              }),
          RadioListTile(
              title: const Text("Do Not Add 15% Tax"),
              value: "False",
              groupValue: gVal,
              onChanged: (o) {
                setState(() {
                  gVal = o!;
                });
              }),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () {
                gVal == "False"
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FoodBill(totalBill: totalPrice)))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FoodBill(totalBill: calculateTax(totalPrice))));
              },
              child: const Text("Order"))
        ],
      ),
    );
  }
}
