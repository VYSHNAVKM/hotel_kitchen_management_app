import 'package:flutter/material.dart';
import 'package:hotel_kitchen_management_app/globel_widgets/chef_details.dart';
import 'package:hotel_kitchen_management_app/utils/color_constant.dart';
import 'package:hotel_kitchen_management_app/utils/textstyle_constant.dart';

class AssignOrdersToChef extends StatelessWidget {
  const AssignOrdersToChef({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: dark,
            )),
        title: Text(
          'SELECT CHEF',
          style: maintextdark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 5),
                            image: DecorationImage(
                                image: AssetImage(
                                    chefDetails[index].image.toString())),
                            color: dark),
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        chefDetails[index].name.toString(),
                        style: maintextdark,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.blue.shade900)),
                          onPressed: () {},
                          child: Text(
                            'Send order',
                            style: subtextlight,
                          ))
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: chefDetails.length),
          ]),
        ),
      ),
    );
  }
}
