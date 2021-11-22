import 'package:equatable/equatable.dart';
import 'package:pin_shop/model/product_model.dart';

class WishlistModel extends Equatable {
  final List<ProductModel> products;

  const WishlistModel({this.products = const <ProductModel>[]});

  @override
  List<Object?> get props => [products];
}
