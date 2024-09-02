import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/mydrawer.dart';
import 'package:minimal_ecom_app/components/producttile.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //accesing products
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=> 
        Navigator.pushNamed(context, '/cart'), 
        icon: Icon(Icons.shopping_cart_outlined)) 
        ],
        backgroundColor:Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Screen"), ),
        drawer:  MyDrawer(),
        
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          SizedBox(height: 25,),
          //subtitle
          Center(child: Text("Pick from list of premium products",
          style: TextStyle(color:
           Theme.of(context).colorScheme.inversePrimary),
          )),
          //prduct list
          SizedBox(
        height: 550,
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index){
          final product = products[index];
          return ProductTile(product: product);
        }),
      )
        ],
      ),
        

    );
  }
}