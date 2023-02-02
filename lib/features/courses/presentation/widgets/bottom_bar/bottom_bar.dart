import 'package:e_sheet/features/courses/presentation/widgets/bottom_bar/bottom_bar_utils.dart';
import 'package:e_sheet/features/courses/presentation/widgets/bottom_bar/bottom_bar_icons.dart';
import 'package:e_sheet/features/courses/presentation/widgets/bottom_bar/center_icon.dart';
import 'package:flutter/material.dart';

class DiamondBottomNavigation extends StatelessWidget {
  final List<IconData> itemIcons;
  final IconData centerIcon;
  final int selectedIndex;
  final Function(int) onItemPressed;
  final Color selectedColor;
  final Color selectedLightColor;
  final Color unselectedColor;

  const DiamondBottomNavigation({
    Key? key,
    required this.itemIcons,
    required this.centerIcon,
    required this.selectedIndex,
    required this.onItemPressed,
    this.selectedColor = const Color(0xff46BDFA),
    this.unselectedColor = const Color(0xffB5C8E7),
    this.selectedLightColor = const Color(0xff77E2FE),
  })  : assert(itemIcons.length == 4 || itemIcons.length == 2,
            "Item must equal 4 or 2"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.initSize(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AllBottomIcon(
            itemIcons: itemIcons,
            selectedIndex: selectedIndex,
            onItemPressed: onItemPressed,
            selectedColor: selectedColor,
            unselectedColor: unselectedColor),
        DiamondIcon(
            onItemPressed: onItemPressed,
            centerIcon: centerIcon,
            itemIcons: itemIcons,
            selectedIndex: selectedIndex,
            selectedLightColor: selectedLightColor),

      ],
    );
  }

}
