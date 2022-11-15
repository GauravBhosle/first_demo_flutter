import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../../features/models/user_local_api_todo.dart';
class BasicRepository{
  String baseUrl="http://192.168.122.1:3000/users";
  var client=http.Client();

  Future<List<UserLocalApiTodo>?> getApiUsers() async{
    try{
      var url=Uri.parse(baseUrl);
      var response=await client.get(url);
      if(response.statusCode==200){
        final jsonresponse = response.body;
        print(json);
        return userLocalApiTodoFromJson(jsonresponse);
      }
    }catch(e){
      print(e);
    }
    print("Fail");
  }

  Future<String?> postUserData(UserLocalApiTodo userLocalApiTodo) async{
    try {
      // List<UserLocalApiTodo> userList=[];
      // userList.add(userLocalApiTodo);
      // var json=userLocalApiTodoToJson(userList);
      var response=await client.post(Uri.parse(baseUrl),
          headers: {
            "content-type" :"application/json; charset=UTF-8"
          },body: jsonEncode(userLocalApiTodo));
      print(response);
      return "success";
    }catch(e){
      return e.toString();
    }
  }

  Future<String?> deleteUserData(Map<String,dynamic> delete) async{
    try{
      var response= await client.delete(Uri.parse(baseUrl),body: jsonEncode(delete));
      print(response);
      return "Deleted";
    }catch(e){
      print(e);
    }
  }
}

  // Future<List<UserLocalApiTodo>?> getLocalApiUserdata() async {
  //   try {
  //     var response = await Dio().get(baseUrl);
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
