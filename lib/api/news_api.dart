import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/constants/news_constants.dart';
import 'package:news_api/model/news_model.dart';

class newsApiServices {
  Future<List<newsmodel>> fetchnews() async {
    final response = await http.get(
      Uri.parse(endpoint),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => newsmodel.fromJson(e)).toList();
    } else {
      throw Exception('failed to load news');
    }
  }
}

// final newsApServicesprovider = Provider<newsApiServices>((ref) {
// //   return newsApiServices();
// });
