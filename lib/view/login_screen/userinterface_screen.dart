import 'package:flutter/material.dart';
import 'package:hotel_kitchen_management_app/utils/textstyle_constant.dart';
import 'package:hotel_kitchen_management_app/view/login_screen/admin_login_screen/admin_login_screen.dart';
import 'package:hotel_kitchen_management_app/view/login_screen/chef_login_screen/chef_login_screen.dart';

class UserinterfaceScreen extends StatefulWidget {
  const UserinterfaceScreen({super.key});

  @override
  State<UserinterfaceScreen> createState() => _UserinterfaceScreenState();
}

class _UserinterfaceScreenState extends State<UserinterfaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blue.shade900)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdminLoginScreen(),
                  ));
                },
                child: Text(
                  'ADMIN LOGIN',
                  style: subtextlight,
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blue.shade900)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChefLoginScreen(),
                  ));
                },
                child: Text(
                  'CHEF LOGIN',
                  style: subtextlight,
                )),
          ],
        ),
      ),
    );
  }
}
