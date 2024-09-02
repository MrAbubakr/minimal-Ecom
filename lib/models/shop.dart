import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/models/product.dart';
class Shop extends ChangeNotifier{
  // product for sale
final List<Product> _shop = [
  Product(Name: "product 1 ", 
  price: 999.99,  
  description:
   "Product 1's description is here You can buy from here with lowest amout as compared to other shops",
   //imagePath: ,
   ),
   Product(Name: "product 2", 
  price: 999.99, 
  description: "Product 2's description is here",
   //imagePath: ,
   ),
   Product(Name: "product 3", 
  price: 999.99, 
  description: "Product 3's description is here",
   //imagePath: ,
   ),
   Product(Name: "product 4", 
  price: 999.99, 
  description: "Product 4's description is here",
   //imagePath: ,
   ),];
  //user cart
  List<Product> _cart = [];
  //get product list
  List<Product> get shop => _shop;
  //get user  cart
  List<Product> get cart => _cart;
  // add to cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }
  //remove form cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}