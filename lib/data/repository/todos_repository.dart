import '../model/todos.dart';

abstract class TodosRepository {
  Future<List<Todos>> getTodos();

  Future<Todos> getDetailTodos(String id);

  Future<Todos> createTodos(Todos todos);

  Future<Todos> editTodos(Todos todos);

  Future<Todos> patchTodos(
      {String? id,
      String? title,
      String? completed,
      String? priority,
      String? dueDate});

  Future<String> deleteTodos(String id);
}
