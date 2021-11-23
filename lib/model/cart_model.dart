import 'package:equatable/equatable.dart';

import 'product_model.dart';

class CartModel extends Equatable {
  final List<ProductModel> products;

  const CartModel({this.products = const <ProductModel>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0.0;
    } else {
      return 10;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30) {
      return 'You Have Free Delivery Fee';
    } else {
      return 'Add \$ ${(30.0 - subtotal).toStringAsFixed(2)} for FREE Delivery Fee';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
