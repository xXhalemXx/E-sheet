import 'package:e_sheet/core/general_use/constant.dart';
import 'package:e_sheet/features/courses/presentation/widgets/delete_course_widgets/delete_button.dart';
import 'package:flutter/material.dart';

class ListOfCoursesWithButton extends StatefulWidget{

  final List<String> courses;
    String? dropDownValue;

   ListOfCoursesWithButton({super.key,required this.courses,required this.dropDownValue});

  @override
  State<ListOfCoursesWithButton> createState() => _ListOfCoursesWithButtonState();
}

class _ListOfCoursesWithButtonState extends State<ListOfCoursesWithButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: backGroundPicture(context),
          ),
          const SizedBox(
            height: 25,
          ),
          ButtonTheme(
            alignedDropdown: true,
              child: dropDownButtonList(widget.courses)),
          const SizedBox(
            height: 10,
          ),
           DeleteButton(dropDownValue: widget.dropDownValue,),
        ],
      ),
    );
  }

  Widget backGroundPicture(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.asset('assets/pics/delete.png'),
    );
  }

  DropdownButtonFormField dropDownButtonList(List<String> courses) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      items: allItems(courses),
      value:widget.dropDownValue,
      onChanged: (Object? value) {
        setState((){widget.dropDownValue = value.toString();});
      },
      hint: const Text(
        AllTexts.selectCourseToDelete,
      ),
      borderRadius: BorderRadius.circular(25),
    );
  }

  List<DropdownMenuItem<dynamic>> allItems(List<String> courses) {
    return courses.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
          value: value,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.book_outlined,

              ),
              Text(
               cutStringToFit( removeUnderscore(value)),
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ));
    }).toList();
  }

  String removeUnderscore(String value) {
    List tempCourses = value.split('');
    String tempString = '';
    for (var x in tempCourses) {
      if (x != '_') {
        tempString += x;
      } else {
        tempString += ' ';
      }
    }
    return tempString;
  }
  String cutStringToFit(String value) {
    if(value.length>=25)
      {
        return '${value.substring(0,23)}...';
      }
    else{
      return value;
    }

  }

}