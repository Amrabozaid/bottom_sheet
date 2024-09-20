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
            Image.asset('assets/asset1.png'),
            const Text("Welcome",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Colors.red),),
            const Text(
              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed\ndo eiusmod",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 218, 249, 255),fontSize: 15)
              ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),backgroundColor: Colors.amber[400]
                  ),
                  onPressed: () {
                  showModalBottomSheet(
                    context: context, 
                    builder: (context)=> const RegisterBottomSheet(), 
                  );
                }, child:const Text("Create Account",style:TextStyle(fontSize: 20,color: Colors.black),)),
              ),
            ),  
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.amber,width: 2)
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