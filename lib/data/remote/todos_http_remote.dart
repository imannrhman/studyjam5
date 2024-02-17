import 'dart:convert';

import 'package:http/http.dart';
import 'package:studyjam5/data/model/todos.dart';
import 'package:studyjam5/util/config.dart';

import '../repository/todos_repository.dart';

class TodosHTTPRemote implements TodosRepository {
  var client = Client();
  var baseUrl = Config.baseUrl;

  @override
  Future<List<Todos>> getTodos() async {
    try {
      // TODO 2 : Buat Request Client
      var response = await client.get(Uri.parse("$baseUrl/todos"));
      if (response.statusCode == 200) {
        return todosFromJson(response.body);
      } else {
        throw "Terdapat Kesalahan";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  getDetailTodos(String id) {
    // TODO: implement getDetailTodos
    throw UnimplementedError();
  }

  @override
  Future<Todos> createTodos(Todos todos) async {
    // TODO: implement createTodos
    try {

      var response = await client.post(
        Uri.parse("$baseUrl/todos"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/jsom'
        },
        body: jsonEncode(todos.toJson()),
      );

      if (response.statusCode == 201) {
        return Todos.fromJson(jsonDecode(response.body));
      } else {
        throw "Gagal Menambah Todos";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  editTodos(Todos todos) {
    // TODO: implement editTodos
    throw UnimplementedError();
  }

  @override
  patchTodos(
      {String? id,
      String? title,
      String? completed,
      String? priority,
      String? dueDate}) {
    // TODO: implement patchTodos
    throw UnimplementedError();
  }

  @override
  deleteTodos(String id) {
    // TODO: implement deleteTodos
    throw UnimplementedError();
  }
}
