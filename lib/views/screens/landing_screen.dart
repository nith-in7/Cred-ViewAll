import 'package:cached_network_image/cached_network_image.dart';
import 'package:cred_assign/providers/selected_item_provider.dart';
import 'package:cred_assign/views/screens/category_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neopop/neopop.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedItem = ref.watch(selectedItemProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (selectedItem == null)
              Image.asset("assets/logo/cred_logo.png", width: 24.w)
            else
              CachedNetworkImage(
                width: 20.w,
                imageUrl: selectedItem.iconUrl,
              ),
            SizedBox(height: 30.sp),
            Text.rich(
                TextSpan(children: [
                  const TextSpan(
                    text: "CRED ",
                  ),
                  if (selectedItem != null)
                    TextSpan(
                        text: selectedItem.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white))
                ]),
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white, fontSize: 19.sp)),
            SizedBox(height: 12.sp),
            Text("grow your savings.",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge),
            Text("3x faster",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 24.sp),
            NeoPopButton(
              onTapDown: () => HapticFeedback.vibrate(),
              onTapUp: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryScreen(
                              isGridView: false,
                            )));
              },
              color: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 15.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Go to category",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: 12.sp,
                    ),
                    const Icon(
                      size: 30,
                      Icons.trending_flat,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
