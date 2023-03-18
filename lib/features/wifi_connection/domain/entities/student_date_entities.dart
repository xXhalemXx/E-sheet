 class StudentDate {
  final int nationalId;
  final int date;

  //assign data as map
  StudentDate(
      {
      required this.date,
      required this.nationalId});

  Map<String, dynamic> tomap(){
    return {
      'nationalId': nationalId,
      'date': date,
    };
  }

}
