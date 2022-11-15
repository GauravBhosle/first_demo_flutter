import 'package:first_demo_flutter/src/features/models/post.dart';
import 'package:http/http.dart' as http;

class GetPosts{

  Future<List<PostTodo>?> getPostFromApi() async {
    var client=http.Client();
    
    var url=Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var response= await client.get(url);

    if(response.statusCode==200){
      var json=response.body;
      return postTodoFromJson(json);
    }
  }
}