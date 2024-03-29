import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_kitchen_management_app/utils/textstyle_constant.dart';
import 'package:hotel_kitchen_management_app/view/chef_view/chef_interface/chef_interface.dart';
import 'package:hotel_kitchen_management_app/view/login_screen/chef_login_screen/chef_signup_screen.dart';

class ChefLoginScreen extends StatefulWidget {
  const ChefLoginScreen({super.key});

  @override
  State<ChefLoginScreen> createState() => _ChefLoginScreenState();
}

class _ChefLoginScreenState extends State<ChefLoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";
  void _handleLogin() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      print("User Logged In : ${userCredential.user!.email}");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChefInterface(),
          ));
    } catch (e) {}
    print("Error During Logged In : $e");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CHEF LOGIN',
                  style: maintextdark,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'email',
                    labelStyle: subtextdark,
                    hintText: 'email',
                    hintStyle: subtextdark,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter Your Email";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                    labelStyle: subtextdark,
                    hintText: 'password',
                    hintStyle: subtextdark,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter Your Password";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blue.shade900)),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _handleLogin();
                      }
                    },
                    child: Text(
                      'Login',
                      style: subtextlight,
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChefSignUpScreen(),
                          ));
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                          fontSize: 17, color: Colors.blue.shade900),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
