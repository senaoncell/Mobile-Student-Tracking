import 'package:flutter/material.dart';
import 'package:student_tracking_system/models/student.dart';

class StudentUpdate extends StatefulWidget {
  final Student student;

  StudentUpdate(this.student);

  @override
  _StudentUpdateState createState() => _StudentUpdateState();
}

class _StudentUpdateState extends State<StudentUpdate> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.student.firstname;
    _lastnameController.text = widget.student.lastname;
    _gradeController.text = widget.student.grade.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Güncelle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Ad'),
            ),
            TextField(
              controller: _lastnameController,
              decoration: InputDecoration(labelText: 'Soyad'),
            ),
            TextField(
              controller: _gradeController,
              decoration: InputDecoration(labelText: 'Not'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.student.firstname = _nameController.text;
                  widget.student.lastname = _lastnameController.text;
                  widget.student.grade = int.parse(_gradeController.text);
                });
                Navigator.pop(context);
              },
              child: Text("Güncelle"),
            ),
          ],
        ),
      ),
    );
  }
}
