import 'package:cred_assign/models/category_item.dart';
import 'package:cred_assign/providers/selected_item_provider.dart';
import 'package:cred_assign/views/widgets/catergory_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryItemForGrid extends ConsumerStatefulWidget {
  const CategoryItemForGrid({super.key, required this.categoryItem});
  final CategoryItemModel categoryItem;
  @override
  ConsumerState<CategoryItemForGrid> createState() =>
      _CategoryItemForGridState();
}

class _CategoryItemForGridState extends ConsumerState<CategoryItemForGrid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedItemProvider.notifier).updateSate(widget.categoryItem);
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CatergoryIconContainer(
            iconUrl: widget.categoryItem.iconUrl,
            identifier: widget.categoryItem.identifier,
          ),
          SizedBox(
            height: 12.sp,
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              widget.categoryItem.name,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w300, fontSize: 15.sp),
            ),
          )
        ],
      ),
    );
  }
}
