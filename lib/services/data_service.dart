
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/product.dart';



class DataService {
  //  Localhost JSON Server
  // static const String baseUrl =
  //     'http://192.168.0.4:3000'; // Change the IP address to your PC's IP. Remain the port number 3000 unchanged.

  //  Live server on Heroku
  // static const String baseUrl =
  //     'https://jumail-utm-rest-node-mysql.herokuapp.com';

  // Live server on Firebase
 // static const String baseUrl =
     // 'https://us-central1-jumail-backend-firebase-rest.cloudfunctions.net/api';

  // JSON server online
   static const String baseUrl =
         'http://192.168.1.10:3000'; // Change the IP address to your PC's IP. Remain the port number 3000 unchanged.

  // GET request
  Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint',
      headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // POST request
  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // PATCH request
  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // DELETE request
  Future delete(String endpoint) async {
    final response = await http.delete('$baseUrl/$endpoint',
      headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // List of products from the server
  Future<List<Product>> getProductList() async {
    final listJson = await get('pnames');

    return (listJson as List)
        .map((itemJson) => Product.fromJson(itemJson))
        .toList();
  }

  // Updating the status of a given product  (whether is clean or dirty) in the server
  Future<Product> updateProductStatus({String id, bool status}) async {
    final json = await patch('pnames/$id', data: {'clean': status}); 
    return Product.fromJson(json);
  }

  // Creating a new Product in the server
  Future<Product> createProduct({Product product}) async {
    final json = await post('pnames', data: product);
    return Product.fromJson(json);
  }

  // Deleting a given Product  from the server
  Future<Product> deleteProduct({String id}) async {
    final json = await delete('pnames/$id');
    return Product.fromJson(json);
  }
}

final dataService = DataService();
