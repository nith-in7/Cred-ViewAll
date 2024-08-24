import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key, required this.value, required this.onTap});
  final bool value;
  final void Function() onTap;
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: 1.5)),
        width: 10.w,
        height: 2.5.h,
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              AnimatedPositioned(
                width: constraints.maxWidth / 2,
                height: constraints.maxHeight,
                left: !widget.value ? 0 : constraints.maxWidth / 2,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SvgPicture.asset(widget.value
                      ? "assets/icons/list_filled.svg"
                      : "assets/icons/grid_filled.svg"),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
