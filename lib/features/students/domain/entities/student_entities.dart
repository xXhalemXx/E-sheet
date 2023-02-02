 class Student {
  final String name;
  final int nationalId;
  final int atendNumber;

  //assign data as map
  Student(
      {required this.name,
      required this.atendNumber,
      required this.nationalId});

  Map<String, dynamic> tomap(){
    return {
      'nationalId': nationalId,
      'name': name,
      'atendNumber': atendNumber,
    };
  }

}
