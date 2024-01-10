import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_kitchen_management_app/utils/color_constant.dart';
import 'package:hotel_kitchen_management_app/utils/textstyle_constant.dart';
import 'package:hotel_kitchen_management_app/view/admin_view/admin_dashboard/widgets/assign_orders_to_chef.dart';

class IncomingOrders extends StatefulWidget {
  const IncomingOrders(
      {super.key, required this.name, required this.date, required this.items});
  final String name;
  final String date;
  final String items;

  @override
  State<IncomingOrders> createState() => _IncomingOrdersState();
}

class _IncomingOrdersState extends State<IncomingOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3,
            color: dark,
          )),
      width: MediaQuery.of(context).size.width * 0.99,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.name,
          style: maintextdark,
        ),
        SizedBox(
          height: 5,
        ),
        Text(widget.date,
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: dark,
            )),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 5, color: dark)),
          child: Text(
            widget.items,
            style: subtextdark,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AssignOrdersToChef(),
                  ));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blue.shade900)),
                child: Text(
                  'assign orders to chefs',
                  style: subtextlight,
                ))
          ],
        )
      ]),
    );
  }
}
