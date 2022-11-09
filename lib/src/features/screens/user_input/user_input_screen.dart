import 'package:first_demo_flutter/src/common_widgets/form/form_field_widget.dart';
import 'package:flutter/material.dart';

import '../../models/user_todo.dart';

class UserInputScreen extends StatefulWidget{
  UserInputScreen([this.index, this.userTodo,this.addBtn]);
  int? index=null;
  UserTodo? userTodo;
  bool? addBtn;


  @override
  State<StatefulWidget> createState() => _UserInputScreenState();

}

class _UserInputScreenState extends State<UserInputScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FormFieldWidget(widget.index,widget.userTodo,widget.addBtn),
      ),
    );
  }
}