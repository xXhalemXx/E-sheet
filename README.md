# E-sheet
E-sheet is an app designed to simplify the process of taking attendance for students. With E-sheet, you can create and manage attendance records using your device's hotspot and easily share or export the records to various formats.

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Installation](#installation)
- [Credits](#credits)
- [Contributing](#contributing)
- [Contact](#contact)

## Introduction

E-sheet addresses the challenge of taking attendance without access to faculty database. It offers a novel method to input data without relying on a database and establishes efficient device-to-device communication. During the development of this app, I acquired skills in clean architecture, component separation, responsive screen design, local database management, accessing phone storage, and handling required permissions.

  
## Usage

### Initial Setup
1. Upon the first launch, you will see the initial setup screen.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image12.jpeg"  width="300" height="500">
 
2. This screen includes text field validation to ensure proper entry.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image13.jpeg"  width="300" height="500"> <br />

3. After entering your name, you will navigate to a page containing all your courses.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image28.jpg"  width="300" height="500"> <br />
 
### Adding Courses
4. To add courses, go to the settings page.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image36.jpg"  width="300" height="500"> <br />
 
5. Select "Import" to open the import page.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image38.jpg"  width="300" height="500"> <br />

 
6. Choose an Excel file from your storage.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image2.jpg"  width="300" height="500"> <br />

 
7. View the content of the Excel file and add a name to the course.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image3.jpg"  width="300" height="500"> <br />
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image1.jpg"  width="300" height="500"> <br />
 
8. Back on the main screen, you will see the added course.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image30.jpg"  width="300" height="500"> <br />

 ### Mange courses
9. To mange courses press on course name in main secreen.
<p align="center">
 <img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image21.jpeg"  width="300" height="500"> <br />
 
10. you can use search to find any student using name (search show all names contain this string)
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image25.jpeg"  width="300" height="500"> <br />
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image27.jpeg"  width="300" height="500"> <br />
 
11. you can preform CURD functions like
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image22.jpeg"  width="300" height="500"> <br />
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image23.jpeg"  width="300" height="500"> <br />
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image24.jpeg"  width="300" height="500"> <br />

 ### Taking Attendance
12. To take attendance, open the connection screen
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image14.jpeg"  width="300" height="500"> <br />
 
13. Grant necessary permissions by pressing the red button (for the first time).
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image19.jpeg"  width="300" height="500"> <br />
 
14, Start the connection.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image15.jpeg"  width="300" height="500"> <br />
 
15. Select the course for which you want to take attendance.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image16.jpeg"  width="300" height="500"> <br />
 
16.Wait until all students have taken attendance using the [student marker](https://github.com/xXhalemXx/student_marker).
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image17.jpeg"  width="300" height="500"> <br />
 
17. Close the attendance-taking page.
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image18.jpeg"  width="300" height="500"> <br />
 
 ### Exporting Data
18. To export data, go to settings and select "Export this time."
<p align="center">
<img src="https://github.com/xXhalemXx/E-sheet/blob/main/projectImges/image43.jpg"  width="300" height="500"> <br />
 
19. Choose the course you want to export, and you will find an Excel file with student data and attendance times.
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


 
 
## Installation

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

 
