import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_list/screens/shopping_list/data/models/shopping_list_model.dart';
import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_list_entity.dart';
import 'package:shopping_list/screens/shopping_list/domain/use_cases/shopping_list_service.dart';
import 'package:shopping_list/screens/shopping_list/domain/utils/domain_errors.dart';

class ShoppingListServiceImpl implements ShoppingListService {

  final userId = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final String collectionPath = 'users';

  @override
  Future<ShoppingListEntity> retrieve() async {
    DocumentSnapshot userSnapshot = await firestore.collection(collectionPath)
        .doc(userId)
        .get();

    if(!userSnapshot.exists) {
      return const ShoppingListEntity(items: []);
    }

    Map<String, dynamic> userDataJSON = userSnapshot.data() as Map<String, dynamic>;
    return ShoppingListModel.fromJson(userDataJSON).toEntity();
  }

  @override
  Future<ShoppingListEntity> save(ShoppingListEntity shoppingList) async {
    DocumentReference userRef = firestore.collection(collectionPath)
        .doc(userId);

    var userDataJSON = ShoppingListModel.fromEntity(shoppingList, userId).toJson();

    try {
      await userRef.set(userDataJSON, SetOptions(merge: true));
    } catch (e) {
      throw DomainError.errorOnSave;
    }

    await Future.delayed(const Duration(seconds: 2));
    return shoppingList;
  }
  
}