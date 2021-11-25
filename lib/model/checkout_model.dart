import 'package:equatable/equatable.dart';
import 'package:pin_shop/model/product_model.dart';

class CheckoutModel extends Equatable {
  final String? email;
  final String? fullName;
  final String? address;
  final String? city;
  final String? country;
  final List<ProductModel>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const CheckoutModel({
    required this.email,
    required this.fullName,
    required this.address,
    required this.city,
    required this.country,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  List<Object?> get props => [
        email,
        fullName,
        address,
        city,
        country,
        products,
        subtotal,
        deliveryFee,
        total,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = {};

    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;

    return {
      'customerAddress': customerAddress,
      'customerEmail': email!,
      'customerName': fullName!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
    };
  }
}
