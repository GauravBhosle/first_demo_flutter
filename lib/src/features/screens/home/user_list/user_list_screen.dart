import 'dart:convert';

import 'package:first_demo_flutter/src/common_widgets/form/form_field_widget.dart';
import 'package:first_demo_flutter/src/constants/app_colors/AppColors.dart';
import 'package:first_demo_flutter/src/constants/images/image_strings.dart';
import 'package:first_demo_flutter/src/features/screens/user_input/user_input_screen.dart';
import 'package:first_demo_flutter/src/localizations/service.dart';
import 'package:flutter/material.dart';

import '../../../models/user_todo.dart';

class UserListScreen extends StatefulWidget {
  List<UserTodo> userList = <UserTodo>[];
  String? stringToEdit='';
  bool addbtn=true;

  @override
  State<StatefulWidget> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    getList();
    print("InitState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.userList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 80,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(PersonLogo),
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(widget.userList[index].userName!),
                    subtitle: Text(widget.userList[index].email!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return UserInputScreen(index,widget.userList[index]);
                              })).then((value) => setState((){
                                  getList();
                              }));
                            },
                            icon: Icon(Icons.mode_edit_outline_outlined,color: AppColors.Img_BG,),
                        ),
                        IconButton(
                          onPressed: () async {

                            showAboutDialog(context: context,index: index);

                          },
                          icon: Icon(Icons.delete_outline ,color: AppColors.Img_BG,)
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserInputScreen(null,null,widget.addbtn);
        })).then((value) => getList());
      },child: Icon(Icons.add,color: Colors.white,),backgroundColor: AppColors.MAIN_COLOR,),
    );
  }

  Future<void> getList() async {
    List<String>? userStringList = await SharedPrefernceHelper.getUserList();
    widget.userList.clear();
    print("InGetListMethod");
    if (userStringList != null) {
      print("Not Null");
      for (int i = 0; i < userStringList.length; i++) {
        Map<String, dynamic> jsonData = jsonDecode(userStringList[i]);
        setState(() {
          widget.userList.add(UserTodo.fromJson(jsonData));
        });
      }
      print(widget.userList.length);
    }
  }

  Future<void> deleteRow(int index) async {
    List<String>? userStringList = await SharedPrefernceHelper.getUserList();
    userStringList?.removeAt(index);
    SharedPrefernceHelper.saveUserList(userStringList);
    getList();

  }



  void showAboutDialog({required BuildContext context, int? index}) {
    Widget okButton = TextButton(
      child: Text("Delete"),
      onPressed: () {
        deleteRow(index!);
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content: Text("Are you sure to delete this item?"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
