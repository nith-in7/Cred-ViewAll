// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:cred_assign/models/category_item.dart';

class CategoryModel {
  final String identifier;
  final String title;
  final List<CategoryItemModel> items;

  CategoryModel(
      {required this.identifier, required this.title, required this.items});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    final properties = map['template_properties'];
    final items = List.from(properties["items"]);
    return CategoryModel(
        identifier: properties["header"]['identifier'] as String,
        title: properties["header"]['title'] as String,
        items: items.map((e) => CategoryItemModel.fromMap(e)).toList());
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.title == title &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode => identifier.hashCode ^ title.hashCode ^ items.hashCode;
}
