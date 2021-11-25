part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? email;
  final String? fullName;
  final String? address;
  final String? city;
  final String? country;
  final CartModel? cart;

  const UpdateCheckout({
    this.email,
    this.fullName,
    this.address,
    this.city,
    this.country,
    this.cart,
  });

  @override
  List<Object?> get props => [
        email,
        fullName,
        address,
        city,
        country,
        cart,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final CheckoutModel checkout;

  const ConfirmCheckout({
    required this.checkout,
  });

  @override
  List<Object?> get props => [
        checkout,
      ];
}
