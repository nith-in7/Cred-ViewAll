import 'package:cred_assign/models/category_model.dart';
import 'package:cred_assign/views/widgets/category_item_for_list.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.sp,
        ),
        Text(
          widget.categoryModel.title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 20.sp,
        ),
        Column(
          children: List.generate(
            widget.categoryModel.items.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.sp),
                child: CategoryItemForList(
                    categoryItem: widget.categoryModel.items[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
