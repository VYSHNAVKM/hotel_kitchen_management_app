import 'package:cloud_firestore/cloud_firestore.dart';

class InventoryManagementController {
// Create a CollectionReference called users that references the firestore collection
  CollectionReference inventorymanagementCollection =
      FirebaseFirestore.instance.collection('inventorymanagement');

//add

  addData(String newIngredientName, String newTotelingredient) {
    inventorymanagementCollection.add({
      "ingredientname": newIngredientName,
      "totelingredient": newTotelingredient,
    });
  }

//update

  updateData({
    required String docId,
    required String updateIngredientname,
    required String updateTotelingredient,
  }) {
    inventorymanagementCollection.doc(docId).update({
      "ingredientname": updateIngredientname,
      "totelingredient": updateTotelingredient,
    });
  }

//delete

  deleteData({
    required String docId,
  }) {
    inventorymanagementCollection.doc(docId).delete();
  }
}
