// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:plv/utils/http/http_client.dart';
import 'package:plv/features/shop/model/product_model.dart';
import 'package:plv/features/shop/model/category_model.dart';
import 'package:plv/utils/http/http_client.dart';

class ProductController extends GetxController {
  final products = [].obs;
  final isLoading = false.obs;
  final box = GetStorage();
  // late Future<List<Product>> _products;
  // final token

  // @override
  // void onInit() {
  //   super.onInit();
  //   _products = fetchProducts("banner-roll-up");
  //   print(_products);
  // }

  Future<List<Product>> fetchProducts(String categorySlug) async {
    final response = await HttpHelper.get("categories/$categorySlug");
    final productsJson = response['products'] as List<dynamic>;
    return productsJson
        .map((productJson) =>
            Product.fromJson(productJson as Map<String, dynamic>))
        .toList();
  }

  Future<List<Category>> fetchCategories() async {
    final response = await HttpHelper.get("categories");
    final productsJson = response['category'] as List<dynamic>;
    return productsJson
        .map((productJson) =>
            Category.fromJson(productJson as Map<String, dynamic>))
        .toList();
  }
}
