import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/product_model.dart';

class AppRepository {
  static Future<List<ProductItem>> getCategoryItemData(int queryInt) async {
    List query = [
      "",
      "/category/electronics",
      "/category/jewelery",
      "/category/men's clothing",
      "/category/women's clothing"
    ];
    // String query = StorageRepository.getString("city");
    // print("sadfsadfasdfasdfafdasdf ${query}");
    String url = "https://fakestoreapi.com/products${query[queryInt]}";
    // ""                                       for all products
    // "/category/electronics",                 electronics
    // "/category/jewelery",                    jewelery
    // "/category/men's clothing",              men's clothing
    // "/category/women's clothing"             women's clothing
    try {
      Response response = await http.get(Uri.parse(url));
      if (200 <= response.statusCode && response.statusCode <= 300) {
        var jsonData = jsonDecode(response.body);
        List<ProductItem> categories = (jsonData as List?)
                ?.map((item) => ProductItem.fromJson(item))
                .toList() ??
            [];
        return categories;
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
  static Future<ProductItem> getProductFromId(int id) async {
    String url = "https://fakestoreapi.com/products/${id}";
    try {
      Response response = await http.get(Uri.parse(url));
      if (200 <= response.statusCode && response.statusCode <= 300) {
        var jsonData = jsonDecode(response.body);
        return ProductItem.fromJson(jsonData);
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

}