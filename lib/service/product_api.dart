import 'dart:convert';
import 'package:barber_shop_app/model/product.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<List<Product>> fetchAll() async {
    final uri = Uri.parse('https://fakestoreapi.com/products');
    final res = await http.get(uri);
    if (res.statusCode != 200) throw Exception('Error al obtener productos');
    final list = json.decode(res.body) as List;
    return list
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
