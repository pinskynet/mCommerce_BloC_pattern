import 'package:pin_shop/model/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<CategoryModel>> getAllCategories();
}
