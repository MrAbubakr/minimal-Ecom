import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/mybutton.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag,
            size: 70,
            color: Theme.of(context).colorScheme.inversePrimary,),
            SizedBox(height: 10,),
            Text("Cart System", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            SizedBox(height: 5,),
            Text("Premium Quality Products", style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
               fontWeight: FontWeight.bold),),
               SizedBox(height: 60,),
               MyButton(
                onTap: ()=> Navigator.pushNamed(context, '/shop'), 
                child: Icon(Icons.arrow_forward,))
          ],
        ),
      ),
    ); 
  }
}