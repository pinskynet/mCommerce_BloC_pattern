import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const ProductModel({
    required this.name,
    required this.category,
    required this.imgUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        imgUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static List<ProductModel> products = [
    const ProductModel(
      name: 'Soft drink #1',
      category: 'Soft Drinks',
      imgUrl:
          'https://images.unsplash.com/photo-1567103472667-6898f3a79cf2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const ProductModel(
      name: 'Soft drink #2',
      category: 'Soft Drinks',
      imgUrl:
          'https://images.unsplash.com/photo-1629203851288-7ececa5f05c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGVwc2l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    const ProductModel(
      name: 'Smoothies #1',
      category: 'Soft Drinks',
      imgUrl:
          'https://media.istockphoto.com/photos/strawberry-milkshake-picture-id504639970?b=1&k=20&m=504639970&s=170667a&w=0&h=pAxH9z1Wk4BQP-f_FH5A3x6u1FOSVtPV73uLX508NoY=',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const ProductModel(
      name: 'Smoothies #2',
      category: 'Soft Drinks',
      imgUrl:
          'https://images.unsplash.com/photo-1610970881699-44a5587cabec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c21vb3RoaWVzJTIwa2l3aXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60  ',
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    const ProductModel(
      name: 'Water #1',
      category: 'Soft Drinks',
      imgUrl:
          'https://images.unsplash.com/photo-1575672402098-d8c01e364557?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
    const ProductModel(
      name: 'Water #2',
      category: 'Soft Drinks',
      imgUrl:
          'https://wineandfood.vn/image/catalog/anh-bai-viet/nuoc-giai-khat/nuoc-khoang/nuoc-suou-khoang-san-pellegrino-co-thiet-ke-sang-trong.jpg',
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
  ];
}
