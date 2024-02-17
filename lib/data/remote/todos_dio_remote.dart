import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:studyjam5/data/model/todos.dart';
import 'package:studyjam5/util/config.dart';

import '../repository/todos_repository.dart';

class TodosDioRemote implements TodosRepository {
  var dio = Dio(BaseOptions(
    baseUrl: Config.baseUrl,
    responseType: ResponseType.plain,
  ));

  @override
  Future<List<Todos>> getTodos() async {
    try {
      var response = await dio.get("/todos");
      return todosFromJson(response.data);
    } on DioException catch(e) {
     rethrow;
    }
    catch (e) {
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
    try {
      var response = await dio.post("/todos",
        data: todos.toJson()
      );
      return Todos.fromJson(jsonDecode(response.data));
    } on DioException catch(e) {
      rethrow;
    }
    catch (e) {
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
