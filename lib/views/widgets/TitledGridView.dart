import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Titledgridview extends StatelessWidget {
  final String title;

  const Titledgridview({super.key, required this.title});
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
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 105,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
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
                Text(
                  "mint",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
