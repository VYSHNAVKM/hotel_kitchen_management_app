import 'package:flutter/material.dart';
import 'package:hotel_kitchen_management_app/controller/inventory_management_controller.dart';
import 'package:hotel_kitchen_management_app/utils/color_constant.dart';
import 'package:hotel_kitchen_management_app/utils/textstyle_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InventoryManagement extends StatefulWidget {
  const InventoryManagement({super.key});

  @override
  State<InventoryManagement> createState() => _InventoryManagementState();
}

class _InventoryManagementState extends State<InventoryManagement> {
  final ingredientnameContoller = TextEditingController();
  final totelingredientContoller = TextEditingController();
  final newIngredientnameContoller = TextEditingController();
  final newTotelingredientContoller = TextEditingController();

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference inventorymanagementCollection =
      FirebaseFirestore.instance.collection('inventorymanagement');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Inventory',
          style: maintextdark,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: dark,
            )),
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
                          'Add Ingredient ',
                          style: maintextdark,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: ingredientnameContoller,
                          decoration: InputDecoration(
                              hintText: 'ingredient name',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: totelingredientContoller,
                          decoration: InputDecoration(
                              hintText: 'totel ingredient',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              InventoryManagementController().addData(
                                  ingredientnameContoller.text.trim(),
                                  totelingredientContoller.text.trim());
                              ingredientnameContoller.clear();
                              totelingredientContoller.clear();
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
        stream: inventorymanagementCollection
            .orderBy("ingredientname", descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot inventorymanagement =
                    snapshot.data!.docs[index];
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
                            inventorymanagement["ingredientname"],
                            style: maintextlight,
                          ),
                        ),
                        Divider(
                          color: dark,
                          thickness: 5,
                        ),
                        Text(
                          inventorymanagement["totelingredient"],
                          style: maintextdark,
                        ),
                        Divider(
                          color: dark,
                          thickness: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  newIngredientnameContoller.text =
                                      inventorymanagement["ingredientname"];
                                  newTotelingredientContoller.text =
                                      inventorymanagement["totelingredient"];
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
                                                  'Update Ingredient ',
                                                  style: maintextdark,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextField(
                                                  controller:
                                                      newIngredientnameContoller,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'ingredient name',
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextField(
                                                  controller:
                                                      newTotelingredientContoller,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'totel ingredient',
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      InventoryManagementController().updateData(
                                                          docId:
                                                              inventorymanagement
                                                                  .id,
                                                          updateIngredientname:
                                                              newIngredientnameContoller
                                                                  .text
                                                                  .trim(),
                                                          updateTotelingredient:
                                                              newTotelingredientContoller
                                                                  .text
                                                                  .trim());
                                                      newIngredientnameContoller
                                                          .clear();
                                                      newTotelingredientContoller
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
                                  InventoryManagementController().deleteData(
                                      docId: inventorymanagement.id);
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
