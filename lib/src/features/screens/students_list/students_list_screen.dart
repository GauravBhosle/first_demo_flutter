import 'package:first_demo_flutter/src/constants/images/image_strings.dart';
import 'package:first_demo_flutter/src/features/models/student_details_todo.dart';
import 'package:first_demo_flutter/src/features/screens/students_form/student_form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentListScreen extends StatefulWidget {

  @override
  State<StudentListScreen> createState() {
    return _StudentListScreenState();
  }
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<StudentDetailsTodo> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(PersonLogo),
                backgroundColor: Colors.grey,
              ),
              title: Text(list[index].name),
              subtitle: Text(list[index].rollNo.toString()),

            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return StudentFormScreen();
          }));
          list.add(result);
          setState(() {

          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


