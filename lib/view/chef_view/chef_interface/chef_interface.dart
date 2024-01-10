import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_kitchen_management_app/utils/textstyle_constant.dart';
import 'package:hotel_kitchen_management_app/view/chef_view/orders.dart/orders.dart';
import 'package:hotel_kitchen_management_app/view/chef_view/update_status/update_status.dart';

class ChefInterface extends StatefulWidget {
  const ChefInterface({super.key});

  @override
  State<ChefInterface> createState() => _ChefInterfaceState();
}

class _ChefInterfaceState extends State<ChefInterface> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Chef Interface', style: maintextdark),
          bottom: TabBar(
            indicatorColor: Colors.blue.shade900,
            indicatorWeight: 8,
            tabs: [
              Tab(
                child: Text(
                  'Orders',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Update status',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Orders(),
            UpdateStatus(),
          ],
        ),
      ),
    );
  }
}
