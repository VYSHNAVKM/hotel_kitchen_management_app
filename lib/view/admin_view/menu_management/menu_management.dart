import 'package:flutter/material.dart';
import 'package:hotel_kitchen_management_app/controller/menu_management_controller.dart';
import 'package:hotel_kitchen_management_app/utils/color_constant.dart';
import 'package:hotel_kitchen_management_app/utils/textstyle_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuManagement extends StatefulWidget {
  const MenuManagement({super.key});

  @override
  State<MenuManagement> createState() => _MenuManagementState();
}

class _MenuManagementState extends State<MenuManagement> {
  final itemnameContoller = TextEditingController();
  final newItemnameContoller = TextEditingController();
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference menumanagementCollection =
      FirebaseFirestore.instance.collection('menumanagement');

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
        centerTitle: true,
        title: Text(
          'MENU',
          style: maintextdark,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 10),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Add items ',
                          style: maintextdark,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: itemnameContoller,
                          decoration: InputDecoration(
                              hintText: 'item name',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              MenuManagementController()
                                  .addData(itemnameContoller.text.trim());
                              itemnameContoller.clear();

                              Navigator.of(context).pop();
                            },
                            child: Text('Save'))
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: menumanagementCollection
            .orderBy("itemname", descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot menumanagement = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: dark, width: 5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: dark,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            menumanagement["itemname"],
                            style: maintextlight,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  newItemnameContoller.text =
                                      menumanagement["itemname"];

                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 5),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Update Items ',
                                                  style: maintextdark,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextField(
                                                  controller:
                                                      newItemnameContoller,
                                                  decoration: InputDecoration(
                                                      hintText: 'items name',
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      MenuManagementController()
                                                          .updateData(
                                                        docId:
                                                            menumanagement.id,
                                                        updateItemname:
                                                            newItemnameContoller
                                                                .text
                                                                .trim(),
                                                      );
                                                      newItemnameContoller
                                                          .clear();

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('UPDATE'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: dark,
                                )),
                            IconButton(
                                onPressed: () {
                                  MenuManagementController()
                                      .deleteData(docId: menumanagement.id);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: Text('No data found'),
          );
        },
      ),
    );
  }
}
