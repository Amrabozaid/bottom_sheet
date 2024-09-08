import 'dart:ffi';

import 'package:flutter/material.dart';
import '../widgets/login_bottom_sheet.dart';
import '../widgets/register_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("welcome",style: TextStyle(fontSize: 24),)),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                showModalBottomSheet(
                  context: context, 
                  builder: (context)=>LoginBottomSheet(), 
                );
              }, child:const Text("Login")),
            ),
            const SizedBox(height: 20),
            SizedBox(width: double.infinity,
              child: ElevatedButton(onPressed: () {
                showModalBottomSheet(
                  context: context, 
                  builder: (context)=> RegisterBottomSheet(), 
                );
              }, child:const Text("Register")),
            )  
          ],
        ),
      ),
    );
  }
}