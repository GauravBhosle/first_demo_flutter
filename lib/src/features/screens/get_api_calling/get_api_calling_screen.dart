import 'package:first_demo_flutter/src/constants/images/image_strings.dart';
import 'package:first_demo_flutter/src/repository/api/basic_repository.dart';
import 'package:first_demo_flutter/src/repository/api/get_posts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/app_colors/AppColors.dart';
import '../../models/post.dart';
import '../../models/user_local_api_todo.dart';


class GetApiCallingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _GetApiCallingScreenState();
}

class _GetApiCallingScreenState extends State<GetApiCallingScreen> {
  List<UserLocalApiTodo>? userList;
  bool isLoaded=false;

  var nameController=TextEditingController();
  var lastNameController=TextEditingController();
  var genderController=TextEditingController();
  var emailController=TextEditingController();
  var houseController=TextEditingController();
  var streetController=TextEditingController();
  var cityController=TextEditingController();
  var pincodeController=TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserfromLocalApi();
  }

  Future<void> getUserfromLocalApi() async {
  userList=await BasicRepository().getApiUsers();
  if(userList!=null){
    setState(() {
      isLoaded=true;
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: userList?.length,
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children:[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey
                      ),
                      child: Image.asset(insta),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userList![index].name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                        ),
                        Text(userList![index].email ?? '',
                        maxLines: 3 ,
                        overflow: TextOverflow.ellipsis,
                        ),
                      ]
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          deleteUserFromApi(index);
                        },
                        icon: Icon(Icons.delete_outline,color: Colors.black,))
                  ]
                ),
              );
            }
        ),
        replacement: Center(
          child: CircularProgressIndicator(
          ),
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        showDialog(
          context: context,builder: (context) => AlertDialog(
          insetPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width-90,
              child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          label: Text("Name"),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                          )
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          label: Text("Last Name"),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                          )
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: genderController,
                        decoration: InputDecoration(
                          label: Text("Gender"),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                          )
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                          )
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(height: 10,),
                      Text("Address"),
                      TextFormField(
                        controller: houseController,
                        decoration: InputDecoration(
                            label: Text("House No."),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                            )
                        ),
                      ),SizedBox(height: 10,),
                      TextFormField(
                        controller: streetController,
                        decoration: InputDecoration(
                            label: Text("Street"),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                            )
                        ),
                      ),SizedBox(height: 10,),
                      TextFormField(
                        controller: cityController,
                        decoration: InputDecoration(
                            label: Text("City"),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                            )
                        ),
                      ),SizedBox(height: 10,),
                      TextFormField(
                        controller: pincodeController,
                        decoration: InputDecoration(
                            label: Text("Pincode"),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.MAIN_COLOR)
                            )
                        ),keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              SubmitData(nameController.text,lastNameController.text,genderController.text,emailController.text,houseController.text,streetController.text,cityController.text,pincodeController.text);
                            },
                            child: Text(
                              "Submit"
                            )
                          ),
                        ]
                      )


                    ],
                  ),
              ),
            ),
          ),
        ),
        );
        },
        child: Icon(
          Icons.add,color: Colors.white,
        ),
        backgroundColor: AppColors.MAIN_COLOR,
      ),
    );
  }

  Future<void> SubmitData(String name,String lastName,String gender,String email,String house,String street,String city, String pincode) async {
    Address address=Address(street: street,suite: house,city: city,zipcode: pincode);

    UserLocalApiTodo userLocalApiTodo=new UserLocalApiTodo(name: name, lastName: lastName, gender: gender, email: email, address: address);
    String? res=await BasicRepository().postUserData(userLocalApiTodo);
    print(res);
      if(res =="success"){
        Fluttertoast.showToast(msg: 'Successfull Added');
        Navigator.of(context).pop();
        setState(() {
          getUserfromLocalApi();
        });
      }
      else{
        Fluttertoast.showToast(msg: 'Error Occurred');
      }

  }

  Future<void> deleteUserFromApi(int index) async {
    Map<String,dynamic> delete={
      "email" : userList?[index].email
    };
    String? res=await BasicRepository().deleteUserData(delete);
    print(res);
    if(res=="Deleted"){
      Fluttertoast.showToast(msg: res!);
      setState(() {
        getUserfromLocalApi();
      });
    }
  }
}