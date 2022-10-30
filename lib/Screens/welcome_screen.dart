import 'package:flutter/material.dart';
import 'package:food_order/Screens/add_items.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddItems()));
        }, child:const Text("Add Food Items")),
       // ElevatedButton(onPressed: (){
         // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderFood()));
        //}, child:const Text("Order Food"))
      ],
    );
  }
}

