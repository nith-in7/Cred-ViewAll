import 'dart:convert';

import 'package:cred_assign/models/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'category_provider.g.dart';

@Riverpod(keepAlive: true)
class Category extends _$Category {
  @override
  Future<List<CategoryModel>> build() {
    return _getCategoryData();
  }

  Future<List<CategoryModel>> _getCategoryData() async {
    final response =
        await http.get(Uri.parse("https://cred-server.onrender.com/"));
    final body = jsonDecode(response.body);
    final sections = List.from(body['sections']);

    final categories = sections.map((e) => CategoryModel.fromMap(e)).toList();
    return categories;
  }
}
