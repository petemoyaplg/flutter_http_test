import 'package:flutter/material.dart';
import 'package:flutter_http_test/controllers/todo_controller.dart';
import 'package:flutter_http_test/models/Todo.dart';
import 'package:flutter_http_test/repository/todo_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todoController = TodoController(TodoRepository());

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('API REST 1'),
        ),
      ),
      body: FutureBuilder<List<Todo>>(
        future: todoController.fetchTodoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Erreur !!!"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                Todo? todo = snapshot.data?[index];
                return Container(
                  height: 100.00,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text('${todo?.id}'),
                      ),
                      Expanded(
                        flex: 10,
                        child: Text('${todo?.title}'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: (() {}),
                                child: builCallContainer(
                                    'patch', const Color(0xFFFFE0B2))),
                            InkWell(
                                onTap: (() {}),
                                child: builCallContainer(
                                    'put', const Color(0xFFE1BEE7))),
                            InkWell(
                                onTap: (() {}),
                                child: builCallContainer(
                                    'del', const Color(0xFFFFCDD2))),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 0.5,
                  height: 0.5,
                );
              },
              itemCount: snapshot.data?.length ?? 0);
        },
      ),
    );
  }

  Container builCallContainer(String title, Color color) {
    return Container(
      width: 40.0,
      height: 40.0,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(title),
    );
  }
}
