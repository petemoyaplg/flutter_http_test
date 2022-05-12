import 'package:flutter_http_test/models/Todo.dart';
import 'package:flutter_http_test/repository/repository.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);

  // get
  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }

  //patch
  Future<String> updatePatchCopleted(Todo todo) async {
    return _repository.patchCompleted(todo);
  }

  //put
  Future<String> updatePutCopleted(Todo todo) async {
    return _repository.putCompleted(todo);
  }

  //delete
  Future<String> deleteTodo(Todo todo) async {
    return _repository.deletedTodo(todo);
  }

  //delete
  Future<String> postTodo(Todo todo) async {
    return _repository.postTodo(todo);
  }
}
