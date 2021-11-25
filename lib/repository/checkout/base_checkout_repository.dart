import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pin_shop/model/checkout_model.dart';
import 'package:pin_shop/repository/checkout/checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository{
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({FirebaseFirestore? firebaseFirestore}):_firebaseFirestore = firebaseFirestore??FirebaseFirestore.instance;

  

  @override
  Future<void> addCheckout(CheckoutModel checkout) {
    return _firebaseFirestore.collection('checkouts').add(checkout.toDocument());
  }
  
}