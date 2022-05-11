import 'package:flutter_http_test/models/Todo.dart';
import 'package:flutter_http_test/repository/repository.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);

  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }
}
