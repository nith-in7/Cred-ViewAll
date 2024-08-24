import 'package:cred_assign/views/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryHeaderWidget extends StatefulWidget {
  const CategoryHeaderWidget(
      {super.key, required this.onTap, required this.value});
  final bool value;
  final void Function() onTap;
  @override
  State<CategoryHeaderWidget> createState() => _CategoryHeaderWidgetState();
}

class _CategoryHeaderWidgetState extends State<CategoryHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "explore",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Row(
          children: [
            Text(
              "CRED",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            CustomSwitch(
              value: widget.value,
              onTap: widget.onTap,
            ),
            SizedBox(
              width: 24.sp,
            ),
            Container(
              height: 2.5.h,
              width: 5.5.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1)),
              child: SvgPicture.asset(
                "assets/icons/arrow_down.svg",
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            )
          ],
        )
      ],
    );
  }
}
