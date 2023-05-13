import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('About',style: TextStyle(fontSize: 30.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            version(context),
            info(context),
            features(context),
            email(context),
          ],
        ),
      ),
    );
  }
}
Container version(BuildContext context) {
  return Container(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.all(10),
    child: Text(
        'Version: 1.0.0 \nRelease Date: January 1, 2023 \nDeveloper: Tech Beast.',
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            height: MediaQuery.of(context).size.height * 0.003)),
  );
}

Container info(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Text(
      'The Attendance Application is a software program designed to help teachers and school administrators track attendance records for individual students. With the help of this application, teachers can easily track the attendance of their students, generate reports.',
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          height: MediaQuery.of(context).size.height * 0.002),
    ),
  );
}

Container features(BuildContext context) {
  List<String> strings = [
    'Record student attendance automatically',
    'View attendance records for a specific course',
    'Generate reports for attendance records',
    'Real-time reporting on attendance records',
    'Analytics and insights on student attendance data',
    'Secure and private data protection',
  ];
  List<Widget> featuresList = createFeaturesList(strings, context);
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: featuresList,
    ),
  );
}

List<Widget> createFeaturesList(List<String> strings, BuildContext context) {
  double fontSize = MediaQuery.of(context).size.width * 0.047;
  List<Widget> result = [];
  result.add(
    Text(
      'Features:',
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.07,
          fontWeight: FontWeight.bold),
    ),
  );
  for (String value in strings) {
    result.add(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '⦿',
          style: TextStyle(
              fontSize: fontSize,
              height: MediaQuery.of(context).size.width * 0.0032),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.006,
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: fontSize),
          ),
        )
      ],
    ));
  }
  return result;
}

Container email(BuildContext context) {
  return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  height: MediaQuery.of(context).size.height * 0.002),
              children: [
                const TextSpan(
                    text:
                    'For more information or support, please contact us at ',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                  text: 'e.sheet.supp@gmail.com',
                  style:  const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'e.sheet.supp@gmail.com',
                      );
                      if (await canLaunchUrl(emailLaunchUri)) {
                        await launchUrl(emailLaunchUri);
                      } else {
                        throw 'Could not launch email';
                      }
                    },
                ),
                const TextSpan(
                    text: '.\nThank you for using the Attendance Application!',
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ));
}

