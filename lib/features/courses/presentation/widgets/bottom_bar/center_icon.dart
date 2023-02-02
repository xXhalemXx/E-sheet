import 'package:e_sheet/features/courses/presentation/widgets/bottom_bar/bottom_bar_utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiamondIcon extends StatelessWidget with SizeConfig {
  final Function onItemPressed;
  final List<IconData> itemIcons;
  final int selectedIndex;
  final IconData centerIcon;
  final Color selectedLightColor;

  const DiamondIcon(
      {required this.onItemPressed,
      super.key,
      required this.centerIcon,
      required this.itemIcons,
      required this.selectedIndex,
      required this.selectedLightColor});

  @override
  Widget build(BuildContext context) {
    return Positioned.fromRect(
      rect: Rect.fromCenter(
          center: Offset(getRelativeWidth() * 0.5, getRelativeHeight()*0.16),
          width: getDiamondSize(),
          height: getDiamondSize()),
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Material(
          color: Colors.transparent,
          child: centerIconShape(),
        ),
      ),
    );
  }

  Widget centerIconShape() {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        onItemPressed(2);
      },
      child: Container(
        decoration: centerIconDecoration(),
        child: Center(
            child: Transform.rotate(
          angle: math.pi / 4,
          child: Icon(
            centerIcon,
            color: Colors.white,
          ),
        )),
      ),
    );
  }

  BoxDecoration centerIconDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 25,
          offset: const Offset(0, 5),
          color: selectedIndex == 2
              ? const Color(0xff0066FF).withOpacity(0.75)
              : const Color(0xff808080),
        )
      ],
      borderRadius: const BorderRadius.all(Radius.circular(11.5)),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: selectedIndex == 0
            ? [
                selectedLightColor,
                const Color(0xff0066FF),
              ]
            : selectedIndex == 2
                ? [
                    selectedLightColor,
                    const Color(0xff0066FF),
                  ]
                : [
                    const Color(0xffFFFFFF),
                    const Color(0xff808080),
                  ],
      ),
    );
  }
}
