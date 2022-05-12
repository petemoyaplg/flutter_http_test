import 'dart:convert';

import 'package:flutter_http_test/models/Todo.dart';
import 'package:flutter_http_test/repository/repository.dart';
import 'package:http/http.dart' as http;

class TodoRepository implements Repository {
  String dataURL = 'https://jsonplaceholder.typicode.com';

  @override
  Future<String> deletedTodo(Todo todo) async {
    Uri url = Uri.parse('$dataURL/todos/${todo.id}');
    String result = 'false';
    await http.delete(url).then((value) {
      // ignore: avoid_print
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    Uri url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    // ignore: avoid_print
    print('status code : ${response.statusCode}');
    var body = jsonDecode(response.body);
    for (var item in body) {
      todoList.add(Todo.fromJson(item));
    }
    return todoList;
  }

  @override
  Future<String> patchCompleted(Todo todo) async {
    Uri url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    await http.patch(url, body: {
      'completed': (!todo.completed!).toString(),
    }, headers: {
      'Authorization': 'your_token'
    }).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      // ignore: avoid_print
      print(result);
      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> putCompleted(Todo todo) async {
    Uri url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    await http.put(url, body: {
      'completed': (!todo.completed!).toString(),
    }, headers: {
      'Authorization': 'your_token'
    }).then((response) {
      Map<String, dynamic> result = jsonDecode(response.body);
      // ignore: avoid_print
      print(result);
      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> postTodo(Todo todo) async {
    // ignore: avoid_print
    print('${todo.toJson()}');
    Uri url = Uri.parse('$dataURL/todos/');
    String result = '';
    var response = await http.post(url, body: todo.toJson());
    // ignore: avoid_print
    print(response.statusCode);
    // ignore: avoid_print
    print(response.body);
    return 'true';
  }
}
