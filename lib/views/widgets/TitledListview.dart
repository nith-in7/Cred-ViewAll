import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Titledlistview extends StatelessWidget {
  final String title;

  const Titledlistview({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 23, horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
              key: Key(index.toString()),
              children: [
                LocalHero(
                  tag: index.toString(),
                  child: Container(
                    width: 18.w,
                    padding: EdgeInsets.all(15),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: Image.asset(
                      "assets/cred_logo.png",
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "mint",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "grow Your savings 3x faster",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
