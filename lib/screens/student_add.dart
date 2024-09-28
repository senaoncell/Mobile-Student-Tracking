
import 'package:flutter/material.dart';
import 'package:student_tracking_system/models/student.dart';

class StudentAdd extends StatefulWidget{

  List<Student>students;

  /*StudentAdd(List<Student> students){
    this.students=students;
  }*/
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {

  var formKey=GlobalKey<FormState>();
  var student = Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni öğrenci"),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Ad"),
      onSaved: (String? value) {
        student.firstname = value ?? "";
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci soyadı", hintText: "Soyad"),
      onSaved: (String? value) {
        student.lastname = value ?? "";
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrencinin aldığı not", hintText: "Puan"),
      onSaved: (String? value) {
        student.grade = int.parse(value ?? "");
      },
    );
  }

  Widget buildSubmitButton(){
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed:(){
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          widget.students.add(student);
          Navigator.pop(context);
        }
      },
    );
  }
}