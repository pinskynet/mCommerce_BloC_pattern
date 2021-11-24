import 'package:pin_shop/model/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<ProductModel>> getAllProducts();
}
