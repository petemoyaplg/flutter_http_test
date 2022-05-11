import 'package:flutter_http_test/models/Todo.dart';

abstract class Repository {
  // get
  Future<List<Todo>> getTodoList();
  // patch
  Future<String> patchCompleted(Todo todo);
  // put
  Future<String> putCompleted(Todo todo);
  // delete
  Future<String> deletedTodo(Todo todo);
  // post
  Future<String> postTodo(Todo todo);
}
