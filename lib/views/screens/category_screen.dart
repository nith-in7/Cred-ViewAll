import 'package:cred_assign/main.dart';
import 'package:cred_assign/views/widgets/TitledGridView.dart';
import 'package:cred_assign/views/widgets/TitledListview.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({
    super.key,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isGridView = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "explore",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "CRED",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Switch(
                        thumbIcon: WidgetStatePropertyAll(Icon(
                            isGridView ? Icons.grid_view_rounded : Icons.list)),
                        value: isGridView,
                        onChanged: (val) {
                          isGridView = !isGridView;
                          setState(() {});

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => CategoryScreen(
                          //           isGridView: !widget.isGridView),
                          //     ));
                        }),
                    IconButton.outlined(
                        style: IconButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            )),
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down_rounded)),
                  ],
                ),
                LocalHeroScope(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => isGridView
                        ? Titledgridview(title: "MONEY")
                        : Titledlistview(
                            title: "MONEY",
                          ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
