import 'package:cred_assign/models/category_item.dart';
import 'package:cred_assign/providers/selected_item_provider.dart';
import 'package:cred_assign/views/widgets/catergory_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryItemForList extends ConsumerStatefulWidget {
  const CategoryItemForList({super.key, required this.categoryItem});
  final CategoryItemModel categoryItem;
  @override
  ConsumerState<CategoryItemForList> createState() =>
      _CategoryItemForListState();
}

class _CategoryItemForListState extends ConsumerState<CategoryItemForList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedItemProvider.notifier).updateSate(widget.categoryItem);
        Navigator.pop(context);
      },
      child: Row(
        children: [
          CatergoryIconContainer(
            iconUrl: widget.categoryItem.iconUrl,
            identifier: widget.categoryItem.identifier,
          ),
          SizedBox(
            width: 20.sp,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.categoryItem.name,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  widget.categoryItem.description,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
