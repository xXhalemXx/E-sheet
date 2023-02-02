import 'package:e_sheet/features/courses/presentation/widgets/bottom_bar/bottom_bar_utils.dart';
import 'package:flutter/material.dart';
class AllBottomIcon extends StatelessWidget with SizeConfig {
  final Function onItemPressed;
  final List<IconData> itemIcons;
  final int selectedIndex;
  final Color selectedColor;
  final Color unselectedColor;


  const AllBottomIcon(
      {super.key,
        required this.itemIcons,
        required this.selectedIndex,
        required this.onItemPressed,
        required this.selectedColor,
        required this.unselectedColor,
        });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getRelativeHeight(),
      color: Colors.white,
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*(0.1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconValue(0, 0,true),
            const Spacer(flex:2),
            iconValue(1, 1,false),
            const Spacer(flex:7),
            iconValue(2, 3,false),
            const Spacer(flex: 2),
            iconValue(3, 4,false)
          ],
        ),
      ),
    );
  }


Widget iconValue (int ionIndex,int iconPressed ,bool lightOff){
    return Expanded(
      flex: 2,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          splashColor: selectedColor.withOpacity(0.5),
          onTap: () {
            onItemPressed(iconPressed);
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              itemIcons[ionIndex],
              color: selectedIndex == iconPressed
                  ? lightOff?unselectedColor:selectedColor
                  : unselectedColor,
            ),
          ),
        ),
      ),
    );
}

}
