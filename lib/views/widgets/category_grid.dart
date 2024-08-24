import 'package:cred_assign/models/category_model.dart';
import 'package:cred_assign/views/widgets/category_item_for_grid.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
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
        GridView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12.sp,
              crossAxisSpacing: 10.sp,
              crossAxisCount: 3,
              mainAxisExtent: 150),
          children: List.generate(
            widget.categoryModel.items.length,
            (index) {
              return CategoryItemForGrid(
                  categoryItem: widget.categoryModel.items[index]);
            },
          ),
        ),
      ],
    );
  }
}
