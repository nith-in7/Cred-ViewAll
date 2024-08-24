// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryItemModel {
  final String identifier;
  final String name;
  final String description;
  final String iconUrl;

  CategoryItemModel(
      {required this.identifier,
      required this.name,
      required this.description,
      required this.iconUrl});

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    final displayData = map['display_data'];
    return CategoryItemModel(
      identifier: map['identifier'] as String,
      name: displayData['name'] as String,
      description: displayData['description'] as String,
      iconUrl: displayData['icon_url'] as String,
    );
  }

  @override
  bool operator ==(covariant CategoryItemModel other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.name == name &&
        other.description == description &&
        other.iconUrl == iconUrl;
  }

  @override
  int get hashCode {
    return identifier.hashCode ^
        name.hashCode ^
        description.hashCode ^
        iconUrl.hashCode;
  }
}
