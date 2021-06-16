import 'package:app_state_mamagment/repositories/models/product_model.dart';

abstract class IncRepository {
  Future<int> get inc;

  Future increment();

  List<ProductModel> getProduct();
}
