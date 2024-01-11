// Example of a simple admin dashboard
import 'package:flutter/material.dart';
import 'package:hotel_kitchen_management_app/globel_widgets/incoming_orders_list.dart';
import 'package:hotel_kitchen_management_app/utils/color_constant.dart';
import 'package:hotel_kitchen_management_app/utils/textstyle_constant.dart';
import 'package:hotel_kitchen_management_app/view/admin_view/admin_dashboard/widgets/incoming_orders.dart';
import 'package:hotel_kitchen_management_app/view/admin_view/inventory_management/inventory_management.dart';
import 'package:hotel_kitchen_management_app/view/admin_view/menu_management/menu_management.dart';
import 'package:hotel_kitchen_management_app/view/login_screen/admin_login_screen/admin_login_screen.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: dark,
        ),
        title: Text(
          'ADMIN DASHBOARD',
          style: maintextdark,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminLoginScreen(),
                    ));
              },
              icon: Icon(
                Icons.logout_rounded,
                color: dark,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuManagement()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade900)),
                  child: Text(
                    'MENU',
                    style: maintextlight,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InventoryManagement()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade900)),
                  child: Text(
                    'INVENTORY',
                    style: maintextlight,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
              color: dark,
            ),
            Text(
              'Incoming orders',
              style: maintextdark,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return IncomingOrders(
                      name: incomingorderslist[index].name.toString(),
                      date: incomingorderslist[index].date.toString(),
                      items: incomingorderslist[index].items.toString(),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: incomingorderslist.length),
            )
          ],
        ),
      ),
    );
  }
}
