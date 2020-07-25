import 'dart:convert';

import 'package:form_validation/src/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsProvider {
  final String _url = 'https://turn-app-fbcda.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    final url = '$_url/products.json';
    final resp = await http.post(url, body: productModelToJson(product));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<bool> editProduct(ProductModel product) async {
    final url = '$_url/products/${product.id}.json';
    final resp = await http.put(url, body: productModelToJson(product));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductModel>> getAllProducts() async {
    final url = '$_url/products.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductModel> products = new List();

    if (decodedData == null) return [];
    decodedData.forEach((key, prod) {
      final productTemp = ProductModel.fromJson(prod);
      productTemp.id = key;
      products.add(productTemp);
    });
    print(products);
    return products;
  }

  Future<int> deleteProduct(String id) async {
    final url = '$_url/products/$id.json';
    final resp = await http.delete(url);

    print(json.decode(resp.body));
    return 1;
  }
}
