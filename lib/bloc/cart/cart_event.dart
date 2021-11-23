part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class StartCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddCart extends CartEvent {
  final ProductModel product;

  const AddCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveCart extends CartEvent {
  final ProductModel product;

  const RemoveCart(this.product);

  @override
  List<Object> get props => [product];
}
