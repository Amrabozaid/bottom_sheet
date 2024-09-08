import 'package:flutter/material.dart';
import 'package:flutter_2/controllers/user_controller.dart';

import '../models/user.dart';
import 'login_bottom_sheet.dart';

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet({super.key});

  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  @override
  final _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _courseController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController= TextEditingController();
  final _userController = UserController();

  bool _obsecureUserName=false;
  bool _obsecureCourse=false;
  bool _obsecurePassword=true;
  bool _obsecureConfirmPassword=true;

  String? _valdiateUserName(String? value){
    if (value == null || value.isEmpty){return "username or Email is required";}else{return null;}
  }

  String? _valdiateCourse(String? value){
    if (value == null || value.isEmpty){return "username or Email is required";}else{return null;}
  }

  String? _valdiatePassword(String? value){
    if (value == null || value.isEmpty){return "Password is required";}
    if (value.length<8) {return "Password must exceed 8 characters";}
    else{return null;}
  }

  String? _valdiateConfirmPassword(String? value){
    if (value == null || value.isEmpty){return "Password is required";}
    if (value!=_passwordController.text){return "Password not matched";}else{return null;}
  }

  void _submit() {
    if (_formKey.currentState!.validate() ?? false) {
      final user = _userController.createUser(
          _userNameController.text, _passwordController.text);
      print("Registered as ${user.username}");
      Navigator.pop(context);
    } else {
      print("Register Failed");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold( 
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello...',style: TextStyle(fontSize: 14)),
                        SizedBox(height: 4),
                        Text('Register',style: TextStyle(fontSize: 24))
                      ],
                    ),
            
                    IconButton(onPressed:() {Navigator.pop(context);}, icon: const Icon(Icons.close))
            
                  ],
                ),
            
                TextFormField(
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Username/email",
                    labelText: "Username/email",
                    suffixIcon: IconButton(onPressed: (){
                  _obsecureUserName=!_obsecureUserName;
                  setState((){});},
                  icon:_obsecureUserName ? const Icon(Icons.visibility):const Icon(Icons.visibility_off))
                    ),
                  controller: _userNameController,
                  obscureText: _obsecureUserName,
                  validator:  _valdiateUserName,
                ),
            
                const SizedBox(height:10),
            
                TextFormField(
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Course",
                    labelText: "Course",
                    suffixIcon: IconButton(onPressed: (){
                  _obsecureCourse=!_obsecureCourse;
                  setState((){});},
                  icon:_obsecureCourse ? const Icon(Icons.visibility):const Icon(Icons.visibility_off))
                    ),
                  controller: _courseController,
                  obscureText: _obsecureCourse,
                  validator:  _valdiateCourse,
                ),
            
                const SizedBox(height: 10),
            
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password",
                    suffixIcon: IconButton(onPressed: (){
                  _obsecurePassword=!_obsecurePassword;
                  setState((){});},
                  icon:_obsecurePassword ? const Icon(Icons.visibility):const Icon(Icons.visibility_off))
                  ),
                  controller: _passwordController,
                  obscureText: _obsecurePassword,
                  validator: _valdiatePassword,
                ),
            
                const SizedBox(height: 10),
            
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Confirm password",
                    labelText: "Confirm password",
                    suffixIcon: IconButton(onPressed: (){
                  _obsecureConfirmPassword=!_obsecureConfirmPassword;
                  setState((){});},
                  icon:_obsecureConfirmPassword ? const Icon(Icons.visibility):const Icon(Icons.visibility_off))
                  ),
                  controller: _confirmPasswordController,
                  obscureText: _obsecureConfirmPassword,
                  validator: _valdiateConfirmPassword,
                ),
                
                const SizedBox(height: 20),
                SizedBox(width: double.infinity, child:ElevatedButton(
                  onPressed:_submit, child: const Text("Register")
                  )
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a user? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          context: context, builder: (BuildContext context1){return LoginBottomSheet();}, 
                            // isScrollControlled: true
                        );
                      },
                      child: const Text("Login",style: TextStyle(color: Colors.red))
                    )
                  ],
                )
              ]      
            ),
          )
        ),
      )
    );
  }
}