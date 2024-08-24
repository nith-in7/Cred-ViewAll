import 'package:cred_assign/providers/category_provider.dart';
import 'package:cred_assign/views/widgets/category_grid.dart';
import 'package:cred_assign/views/widgets/category_header.dart';
import 'package:cred_assign/views/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key, required this.isGridView});
  final bool isGridView;

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(categoryProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        key: const PageStorageKey<String>("category-screen"),
        slivers: [
          const SliverAppBar(
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            sliver: SliverToBoxAdapter(
              child: CategoryHeaderWidget(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  isGridView: !widget.isGridView,
                                )));
                  },
                  value: widget.isGridView),
            ),
          ),
          ref.watch(categoryProvider).when(
            data: (data) {
              return SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                sliver: SliverList.separated(
                  itemCount: data.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.sp,
                    );
                  },
                  itemBuilder: (context, index) {
                    return widget.isGridView
                        ? CategoryGrid(categoryModel: data[index])
                        : CategoryList(categoryModel: data[index]);
                  },
                ),
              );
            },
            error: (error, stackTrace) {
              return SliverToBoxAdapter(
                  child: Text(
                "error",
                style: Theme.of(context).textTheme.bodyLarge,
              ));
            },
            loading: () {
              return SliverToBoxAdapter(
                  child: Text(
                "loading",
                style: Theme.of(context).textTheme.bodyLarge,
              ));
            },
          )
        ],
      ),
    );
  }
}
