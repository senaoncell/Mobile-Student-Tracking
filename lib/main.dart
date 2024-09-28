import 'package:flutter/material.dart';
import 'package:student_tracking_system/models/student.dart';
import 'package:student_tracking_system/screens/student_add.dart';
import 'package:student_tracking_system/screens/student_update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student> students = [
    Student.withId(1, "Sena", "Öncel", 95),
    Student.withId(2, "Bilgehan", "Sertel", 45),
    Student.withId(3, "Ayşe Gül", "Yıldız", 25),
  ];

  // Seçili öğrenci için başlangıç değeri
  Student selectedStudent = Student.withId(0, "Hiçkimse", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Takip Sistemi"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(students[index].firstname + " " + students[index].lastname),
                subtitle: Text(
                  "Sınavdan aldığı not: ${students[index].grade} [${students[index].getStatus()}]",
                ),
                leading: CircleAvatar(
                  child: Text(students[index].firstname[0]), // Baş harfi göster
                  backgroundColor: Colors.blue,
                ),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    selectedStudent = students[index];
                  });
                },
              );
            },
          ),
        ),
        Text(
          "Seçili öğrenci: " + selectedStudent.firstname + " " + selectedStudent.lastname,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
            children:<Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(width:5.0,),
                      Text("Yeni öğrenci")
                    ],
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentAdd(students)));
                  }
                ),
              ),

              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      SizedBox(width:5.0,),
                      Text("Güncelle")
                    ],
                  ),
                  onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentUpdate(selectedStudent)));
                  },
                ),
              ),

              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete),
                      SizedBox(width:5.0,),
                      Text("Sil")
                    ],
                  ),
                  onPressed: (){
                    setState(() {
                      students.remove(selectedStudent);
                    });
                  },
                ),
              )
            ]
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done, color: Colors.green);
    } else if (grade >= 40) {
      return Icon(Icons.album, color: Colors.orange);
    } else {
      return Icon(Icons.clear, color: Colors.red);
    }
  }
}