import 'package:flutter/material.dart';
import 'package:flutter_2/widgets/register_bottom_sheet.dart';

import '../controllers/user_controller.dart';

class LoginBottomSheet extends StatefulWidget {
  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userController = UserController();
  bool _obsecureUserName=false;
  bool _obsecurePassword=true;
  bool _isChecked = false;

  String? _valdiateUserName(String? value){
    if (value == null || value.isEmpty){return "username or Email is required";}else{return null;}
  }

  String? _valdiatePassword(String? value){
    if (value == null || value.isEmpty){return "Password is required";}
    if (value.length<8) {return "Password must exceed 8 characters";}
    else{return null;}
  }

  void _submit() {
    if (_formKey.currentState!.validate() ?? false) {
      final user = _userController.createUser(
          _userNameController.text, _passwordController.text);
      print("Login as ${user.username}");
      Navigator.pop(context);
    } else {
      print("Login Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child:  SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome back!!!',style: TextStyle(fontSize: 14)),
                        SizedBox(height: 4),
                        Text('Login',style: TextStyle(fontSize: 24))
                      ],
                    ),
            
                    IconButton(onPressed:() {Navigator.pop(context);}, icon: const Icon(Icons.close))
            
                  ],
                ),
                const SizedBox(height: 10),
                
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
                const SizedBox(height: 10),
            
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password",
                    suffixIcon: IconButton(onPressed: (){
                      _obsecurePassword=!_obsecurePassword;
                      setState((){});
                    },
                  icon:_obsecurePassword ? const Icon(Icons.visibility):const Icon(Icons.visibility_off))
                  ),
                  controller: _passwordController,
                  obscureText: _obsecurePassword,
                  validator: _valdiatePassword,
                ),
                const SizedBox(height: 30),
                SizedBox(height: 50,width: double.infinity, child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),backgroundColor: Colors.black
                  ),
                  onPressed: _submit, child: Text("Login",style: TextStyle(color: Colors.amber[100]))
                )),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                        },
                      ),
                      const Text("Remember me")
                    ]
                  ),
                  const Text('Forgot password?',style: TextStyle(decoration: TextDecoration.underline))
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("not a user yet? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context, 
                            builder: (BuildContext context1){return RegisterBottomSheet();}, 
                            // isScrollControlled: true
                          );
                        },
                        child: const Text("Register",style: TextStyle(color: Colors.red))
                      )
                  ],
                )
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}