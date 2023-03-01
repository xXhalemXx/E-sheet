import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseListTail extends StatelessWidget {
  final String? title;
  final Function()? onTap;

    const CourseListTail(
      {Key? key,
      this.title,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //23 old value for height
    double hight=MediaQuery.of(context).size.height*0.17;
    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15.0),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(70),
          bottomLeft: Radius.circular(70),
        ),
        onTap: onTap ?? () {},
        child:tailBody(hight,width,context),
      ),
    );
  }

  Widget tailBody(double hight,double width,BuildContext context) {
    return Ink(
      decoration: backgroundColor(),
      child: SizedBox(
          height: hight,
          width: width,
          child: Stack(
            children: [
              courseName(context),
             waveShape(hight, width, 'Vector'),
             waveShape(hight, width, 'Vector-1'),
            ],
          )),
    );
  }

  BoxDecoration backgroundColor() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.zero,
        topRight: Radius.circular(70),
        bottomLeft: Radius.circular(70),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xff00EFFF),
          Color(0xff0014FF),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ) ;
  }

  Widget courseName(BuildContext context){
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20),
        child: Row(
          children: [
            Icon(Icons.book_outlined,color: Colors.white,size: (MediaQuery.of(context).size.height*0.065)),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.65,
              child: AutoSizeText(
                title ?? 'Course Name',
                maxLines: 1,
                minFontSize: 18,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (MediaQuery.of(context).size.height*0.03),
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget waveShape(double hight,double width,String picName){
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.zero,
        topRight: Radius.circular(70),
        bottomLeft: Radius.circular(70),
      ),
      child: SizedBox(
        height: hight,
        width: width,
        child: SvgPicture.asset('assets/pics/$picName.svg',fit: BoxFit.fill,),
      ),
    );
  }

}
