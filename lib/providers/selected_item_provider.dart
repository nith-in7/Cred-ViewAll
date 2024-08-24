import 'package:cred_assign/models/category_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'selected_item_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedItem extends _$SelectedItem {
  @override
  CategoryItemModel? build() {
    return null;
  }
  void updateSate(CategoryItemModel newItem){
    state=newItem;
  }
}