import 'package:flutter/material.dart';
import 'package:food_order/Screens/order_food.dart';

import '../Models/food_item.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  List<FoodItem> fItemList = [];
  TextEditingController cntrlOne =  TextEditingController();
  TextEditingController cntrlTwo =  TextEditingController();
  late String itemName;
  late double itemPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cntrlOne,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: "Item Name"),
              onChanged: (value) {
                itemName = value;
              },
            ),
            const SizedBox(height: 10.0,),
            TextField(
              controller: cntrlTwo,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: "Item Price"),
              onChanged: (value) {
                itemPrice = double.parse(value);
              },
            ),
            const SizedBox(height: 10.0,),
            ElevatedButton(onPressed: (){
              FoodItem fItem = FoodItem(itemName: itemName, itemPrice: itemPrice,isSelected: false);
              fItemList.add(fItem);
              setState(() {
                cntrlOne.clear();
                cntrlTwo.clear();
              });
            }, child: const Text("Add")),
            const SizedBox(height: 10.0,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderFood(fItemList: fItemList,)));
            }, child: const Text("Order"))
          ],
        ),
      ),
    );
  }
}
