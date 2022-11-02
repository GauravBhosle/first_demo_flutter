import 'package:first_demo_flutter/src/features/models/student_details_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/my_text_form_field_widget.dart';
import '../../../utils/enum/enum.dart';


class StudentFormScreen extends StatefulWidget {
  const StudentFormScreen({Key? key}) : super(key: key);

  @override
  State<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  var nameController = TextEditingController();
  var rollNoController = TextEditingController();
  var contactController = TextEditingController();
  var fatherContactController = TextEditingController();

  Gender? gender;
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Hii",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text("PLease enter below details."),
            SizedBox(
              height: 30,
            ),
            MyTextFormFieldWidget(
                textEditingControler: nameController, fieldName: "Name"),
            SizedBox(
              height: 10,
            ),
            MyTextFormFieldWidget(
                textEditingControler: rollNoController, fieldName: "Roll No."),
            SizedBox(height: 10),
            MyTextFormFieldWidget(
                textEditingControler: contactController, fieldName: "Contact"),
            SizedBox(height: 10),
            MyTextFormFieldWidget(
                textEditingControler: fatherContactController,
                fieldName: "Father's Contact"),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black45
                ),
                borderRadius: BorderRadius.circular(6)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<Gender>(
                      contentPadding: EdgeInsets.all(0.0),
                      value: Gender.Male,
                      groupValue: gender,
                      title: Text(Gender.Male.name),
                      onChanged: (val) {
                        setState(() {
                          gender = val;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<Gender>(
                      contentPadding: EdgeInsets.all(0.0),
                      value: Gender.Female,
                      groupValue: gender,
                      title: Text(Gender.Female.name,),
                      onChanged: (val) {
                        setState(() {
                          gender = val;
                        });
                      },
                    )),
                  Expanded(
                    child: RadioListTile<Gender>(
                      contentPadding: EdgeInsets.all(0.0),
                      value: Gender.Others,
                      groupValue: gender,
                      title: Text(Gender.Others.name),
                      onChanged: (val) {
                        setState(() {
                          gender = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: (){
                  StudentDetailsTodo studentDetailsTodo=new StudentDetailsTodo(nameController.text, int.parse(rollNoController.text), int.parse(contactController.text), int.parse(fatherContactController.text), gender!);
                  Navigator.pop(context,studentDetailsTodo);
                }, 
                child: Text("Submit"))
          ],
        ),
      ),
    ));
  }
}
