class Student {
  int? id;
  String firstname;
  String lastname;
  int grade;
  String? status;


  Student(this.firstname, this.lastname, this.grade);

  //named constructor
  Student.withId(this.id, this.firstname, this.lastname, this.grade);

  String? getStatus() {
    String message= "";
    if (grade >= 50) {
      message='Geçti';
    } else if (grade>40){
      message='Bütünlemeye kaldı';
    }else{
      message="Kaldı";
    }
    status= message;
    return status;
  }
}
