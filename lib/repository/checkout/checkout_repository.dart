import 'package:pin_shop/model/checkout_model.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(CheckoutModel checkout);
}
