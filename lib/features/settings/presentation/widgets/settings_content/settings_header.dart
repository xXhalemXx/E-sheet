import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsHeader extends StatelessWidget {
  final SharedPreferences prefs;
  const SettingsHeader({super.key,required this.prefs});

  @override
  Widget build(BuildContext context) {
     String finalName= setNamFormat();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_pin,
              size: MediaQuery.of(context).size.width * 0.25,
              color: Colors.white,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              child:AutoSizeText(
                'Welcome dr: $finalName',
                maxLines: 1,
                style:const TextStyle(color: Colors.white70,fontSize: 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
 String setNamFormat(){
    String? name =prefs.getString('name');
    List<String> demo=name!.split('');
    String finalName='';
    int index =0;
    for(var character in demo){
      if(index==0){
        finalName+=character.toUpperCase();
        index++;
      }else{
        if(character==' '){
          break;
        }else {
          finalName += character;
          index++;
        }
      }
    }
    return finalName;
  }

}
