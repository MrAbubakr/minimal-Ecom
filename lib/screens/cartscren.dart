import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/mybutton.dart';
import 'package:minimal_ecom_app/models/product.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  // remove item from cart
  void removeItemFromCart(BuildContext context, Product product){
    showDialog(context: context, 
    builder: (context)=>AlertDialog(
      content: const Text("Remove item from cart ?"),
      actions: [
        MaterialButton(onPressed: ()=>Navigator.pop(context),
        child: Text("Cencel"),),

        MaterialButton(onPressed: (){
          Navigator.pop(context);
          context.read<Shop>().removeFromCart(product);
        },
        child: Text("Yes"),),
      ],
    ));
  }
  // pay button pressed
  void payButtonPressed(BuildContext context){
    showDialog(context: context, builder:(context) => AlertDialog(
      content: Text("User Wants to Pay connect to the payment backend"),
    ), );
  }
  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
         
        backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Cart"),),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        // cart list 
        Expanded(
          child:cart.isEmpty? const Center(child: Text("Your Cart Is Empty")): ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
          final item = cart[index];
          return ListTile(
            title: Text(item.Name),
            subtitle: Text(item.price.toStringAsFixed(2)),
            trailing: IconButton(onPressed: ()=> 
            removeItemFromCart(context, item), icon: Icon(Icons.delete_forever)) ,
          );
        }  ),),
        Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: MyButton(onTap:()=> payButtonPressed(context), child: Text("Pay Now")),
        )
      ],),
    );
  }
}