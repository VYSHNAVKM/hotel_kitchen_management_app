import 'package:flutter/material.dart';
import 'package:hotel_kitchen_management_app/utils/textstyle_constant.dart';
import 'package:hotel_kitchen_management_app/view/chef_view/chef_interface/chef_interface.dart';

class ChefLoginScreen extends StatefulWidget {
  @override
  State<ChefLoginScreen> createState() => _ChefLoginScreenState();
}

class _ChefLoginScreenState extends State<ChefLoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChefInterface(),
                  ));
                },
                child: Text('Login'))
            // ElevatedButton(
            //   onPressed: () async {
            //     User? user = await authService.signIn(
            //       emailController.text,
            //       passwordController.text,
            //     );

            //     if (user != null) {
            // Navigate to the next screen or perform other actions
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => HomeScreen(),
            // ));
            // } else {
            //   Text("Valid value enter");
            //     }
            //   },
            //   child: Text('Login'),
            // ),
          ],
        ),
      ),
    );
  }
}
