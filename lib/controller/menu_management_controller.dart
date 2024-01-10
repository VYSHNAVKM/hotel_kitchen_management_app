import 'package:cloud_firestore/cloud_firestore.dart';

class MenuManagementController {
// Create a CollectionReference called users that references the firestore collection
  CollectionReference menumanagementCollection =
      FirebaseFirestore.instance.collection('menumanagement');

//add

  addData(String itemName) {
    menumanagementCollection.add({
      "itemname": itemName,
    });
  }

//update

  updateData({
    required String docId,
    required String updateItemname,
  }) {
    menumanagementCollection.doc(docId).update({
      "itemname": updateItemname,
    });
  }

//delete

  deleteData({
    required String docId,
  }) {
    menumanagementCollection.doc(docId).delete();
  }
}
