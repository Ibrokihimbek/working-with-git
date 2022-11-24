import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/product_model.dart';

class AppRepository{

  static Future<List<ProductItem>> getCategoryItemData(String query) async {
    // String query = StorageRepository.getString("city");
    // print("sadfsadfasdfasdfafdasdf ${query}");
    String url = "https://fakestoreapi.com/products${query}";
    // ""                                       for all products
    // "/category/electronics",                 electronics
    // "/category/jewelery",                    jewelery
    // "/category/men's clothing",              men's clothing
    // "/category/women's clothing"             women's clothing
    try{
      Response response = await http.get(Uri.parse(url));
      if (200<=response.statusCode && response.statusCode <=300){
        List<ProductItem> categories = (json as List?)
            ?.map((item) => ProductItem.fromJson(item))
            .toList() ??
            [];
        return categories;
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }

  }


}