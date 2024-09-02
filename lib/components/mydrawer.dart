import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/mylisttile.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ 
          
          Column(children: [
            DrawerHeader(child: Icon(Icons.shopping_bag,
            size: 70,
            color: Theme.of(context).colorScheme.inversePrimary,),),
           const SizedBox(height: 25,),
           
           MyListTile(
            text: "Shop",
             icon: Icons.home,
              onTap: () => Navigator.pop(context)),

              MyListTile(
            text: "Cart",
             icon: Icons.shopping_cart_checkout,
              onTap: (){Navigator.pop(context);
              Navigator.pushNamed(context, '/cart');}
              ),

              
          ],),

              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: MyListTile(
                          text: "Exit",
                           icon: Icons.exit_to_app,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro', (route) => false)),
              ),
        ],
      ),
    );
  }
}