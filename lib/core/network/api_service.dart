import 'dart:convert';

import 'package:ecommerce/core/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Product>> getProducts() async {
    try {
      final url = Uri.parse('https://fakestoreapi.com/products');
      final response = await http.get(url);
      print('------- ${response.statusCode}'); // Log the status code
      if (response.statusCode == 200) {
        print('Response body: ${response.body}'); // Log the response body
        final jsonData = response.body;
        // print('JSON data: $jsonData'); // Log the JSON data
        // final products = (jsonData as List)
        //     .map((e) => Product.fromJson(e as Map<String, dynamic>))
        //     .toList();
        // print('Parsed products: $products'); // Log the parsed products
        // return products;
        // final jsonResponse = response.body;
        // final List<Product> productList = jsonResponse
        //     .map<Product>((json) => Product.fromJson(json))
        //     .toList();
        // return productList;
        final List<dynamic> rawList = jsonDecode(response.body);

        // 2. Map the raw dynamic elements into your typed User list
        return rawList.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e, stackTrace) {
      print('Error fetching products: $e');
      print('Stack trace: $stackTrace');
      throw Exception('Failed to load products: $e');
    }
  }
}
