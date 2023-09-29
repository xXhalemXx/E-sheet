# E-sheet
E sheet is an app that makes taking attendance of students easy and convenient. With e sheet, you can create and manage attendance records using your device’s hotspot. You can also share and export the records to other formats.
- creating this app make taking attendance is very simple and fast way
- one of most important problem that faculty not providing access to database so I created a new method to fill data whiteout using this database, and find best method to connect between devices.
- I have learned clean architecture and how to separate component of the project and other skills like responsive screen , local database management, accessing phone storage and providing required permissions .
## Usage
**in first open of application it will show like this:**<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image12.jpeg"  width="300" height="500">
 
**this page show in first time only and have validator on text field:** <br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image13.jpeg"  width="300" height="500"> <br />

**after adding your name will navigate to this page that contain all courses in your database:<br />**
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image28.jpg"  width="300" height="500"> <br />
 
**now we need to add some courses to our database we will go to settings page:<br />**
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image36.jpg"  width="300" height="500"> <br />
 
**and chose import to open this page:<br />**
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image38.jpg"  width="300" height="500"> <br />

 
**we need to select excel file from our storage:<br />**
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image2.jpg"  width="300" height="500"> <br />

 
**view content of excel file:<br />**
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image3.jpg"  width="300" height="500"> <br />
 
**add name to this course:<br />**
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image1.jpg"  width="300" height="500"> <br />
 
**back to main screen you will find added course:<br />**
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image30.jpg"  width="300" height="500"> <br />
 
**now you can show students in this course and attendance times:**<br />
<p align="center">
 <img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image21.jpeg"  width="300" height="500"> <br />
 
**you can use search to find any student using name** (**search show all names contain this string**)<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image25.jpeg"  width="300" height="500"> <br />
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image27.jpeg"  width="300" height="500"> <br />
 
**you can preform CURD functions like:**<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image22.jpeg"  width="300" height="500"> <br />
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image23.jpeg"  width="300" height="500"> <br />
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image24.jpeg"  width="300" height="500"> <br />
 
**now most important part how to take attendance you need to open connection screen:**<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image14.jpeg"  width="300" height="500"> <br />
 
**in first time the button will show red which mean you need to grant some permissions:**<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image19.jpeg"  width="300" height="500"> <br />
 
 **now you can press to start connection:**<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image15.jpeg"  width="300" height="500"> <br />
 
**select  course you want to take attendance:**<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image16.jpeg"  width="300" height="500"> <br />
 
**now  wait untile all student take attendance using** [student marker](https://github.com/xXhalemXx/student_marker)<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image17.jpeg"  width="300" height="500"> <br />
 
**after  finishing close this page:**<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image18.jpeg"  width="300" height="500"> <br />
 
**now we done take attendance and saved in our database if we need to export this data we go to settings and  chose export this time**<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image43.jpg"  width="300" height="500"> <br />
 
**select  course you want to export it and it will show location that you can find excel file that contain all students and attendance times and when they attended**<br />
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image45.jpg"  width="300" height="500"> <br />
</p>

## Credits
one of most important helpers third-party packages i will list them in next table 
| Dependency               | Version    | Description                                |
|--------------------------|------------|--------------------------------------------|
| flutter_svg              | ^1.1.5     | SVG rendering support for Flutter.         |
| flutter_bloc             | ^8.1.1     | State management library using the BLoC pattern for Flutter. |
| permission_handler       | ^10.2.0    | Handles runtime permissions in Flutter.    |
| bloc                     | ^8.1.0     | State management library for Dart and Flutter applications. |
| sqflite                  | ^2.1.0     | SQLite plugin for Flutter applications.    |
| path                     | any        | Provides a way to work with file system paths. |
| auto_size_text           | ^3.0.0     | A Flutter widget that automatically resizes text to fit perfectly within its bounds. |
| nearby_connections       | ^3.2.0     | Flutter plugin for peer-to-peer communication over Wi-Fi Direct and Bluetooth. |
| cupertino_icons          | ^1.0.5     | Icon set for Flutter based on Apple's Cupertino design language. |
| build_runner             | ^2.2.1     | A build tool for Dart that generates code for JSON serialization and more. |
| get_it                   | ^7.2.0     | A simple service locator for Dart and Flutter projects. |
| freezed_annotation       | ^2.1.0     | Annotation package for the Freezed code generation library. |
| freezed                  | 2.1.0+1   | A code generation library for immutability in Dart. |
| flutter_styled_toast     | ^2.1.3     | A styled toast plugin for Flutter applications. |
| shared_preferences       | ^2.0.15    | Flutter plugin for reading and writing key-value pairs to persistent storage. |
| flutter_native_splash    | ^2.2.9     | A Flutter package to customize the native splash screen. |
| device_preview           | ^1.1.0     | A Flutter plugin for previewing how your app looks on various devices. |
| path_provider            | ^2.0.11    | Provides a platform-agnostic way to access commonly used locations on the file system. |
| excel                    | ^2.0.1     | A Flutter plugin for reading and writing Excel files. |
| file_picker              | ^5.2.5     | A file picker plugin for Flutter applications. |
| url_launcher             | ^6.1.10    | A Flutter plugin for launching URLs and making phone calls. |


 
 
## Usage

To run this app, you need to have Flutter installed on your machine. You can follow the  [official documentation](https://www.freecodecamp.org/news/how-to-write-a-good-readme-file/)  to set up Flutter.

To run the app on an emulator or a physical device, run the following command in the terminal:

```bash
flutter run

```


To build the app for production, run the following command in the terminal:

```bash
flutter build apk

```


## Contributing

This project is open for contributions. If you want to contribute to this project, please follow these steps:

-   Fork this repository
-   Create a branch with your feature or bug fix name
-   Commit and push your changes
-   Create a pull request

## Contact

If you have any questions or feedback, please feel free to contact me at mohamedhalem909@gmail.com.

 
