import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/models/product.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:provider/provider.dart';
class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key,
   required this.product});
   //add tocart pressed
   void addToCart(BuildContext context){
    showDialog(context: context, 
    builder: (context)=>AlertDialog(
      content: Text("Add item to cart ?"),
      actions: [
        MaterialButton(onPressed: ()=>Navigator.pop(context),
        child: Text("Cencel"),),

        MaterialButton(onPressed: (){
          Navigator.pop(context);
          context.read<Shop>().addToCart(product);
        },
        child: Text("Yes"),),
      ],
    ));
   }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      ),
      
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
       
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
          AspectRatio( aspectRatio: 1,

            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15),
              ),
              width: double.infinity,
               padding: const EdgeInsets.all(25),
              child: const Icon(Icons.favorite)),
          ),
          const SizedBox(height: 25 ,),
          Text(product.Name,
          style: const TextStyle(
            fontSize: 20 , 
            fontWeight: FontWeight.bold),),
            const SizedBox(height: 10 ,),
          Text(product.description, 
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),),
          ],),
          
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('\$' + ' '+ product.price.toStringAsFixed(2)),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10), 
                ),
                child: IconButton(onPressed: ()=> addToCart(context), icon: const Icon(Icons.add)))
            ],
          ),
           
        ],
      ),
    );
  }
}