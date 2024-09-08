import 'dart:ffi';

import 'package:flutter/material.dart';
import '../widgets/login_bottom_sheet.dart';
import '../widgets/register_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('..../assets/asset1.png'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),backgroundColor: Colors.amber[400]
                  ),
                  onPressed: () {
                  showModalBottomSheet(
                    context: context, 
                    builder: (context)=> RegisterBottomSheet(), 
                  );
                }, child:const Text("Create Account",style:TextStyle(fontSize: 20,color: Colors.black),)),
              ),
            ),  
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.amber,width: 2)
                    ),
                      backgroundColor: Colors.black
                  ),
                  onPressed: () {
                  showModalBottomSheet(
                    context: context, 
                    builder: (context)=>LoginBottomSheet(), 
                  );
                }, child:const Text("Login",style: TextStyle(fontSize: 24, color: Colors.amber),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}