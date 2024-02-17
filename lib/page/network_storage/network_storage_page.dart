import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studyjam5/data/local/todos_sqflite_local.dart';
import 'package:studyjam5/data/model/todos.dart';
import 'package:studyjam5/data/remote/todos_dio_remote.dart';
import 'package:studyjam5/data/remote/todos_http_remote.dart';
import 'package:studyjam5/data/repository/todos_repository.dart';
import 'package:studyjam5/widgets/item_todos.dart';

import '../../widgets/modal_bottom_form.dart';

class NetworkStoragePage extends StatefulWidget {
  const NetworkStoragePage({super.key});

  @override
  State<NetworkStoragePage> createState() => _NetworkStoragePageState();
}

class _NetworkStoragePageState extends State<NetworkStoragePage> {
  late TodosRepository todosRepository;

  @override
  void initState() {
    todosRepository = TodosSqfliteLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, "),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {});
          return todosRepository.getTodos();
        },
        child: showListData(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomForm(context).then((value) {
            if (value != null) {
              todosRepository.createTodos(value).then((value) {
                print(value);
                setState(() {});
              });
            }
          });
        },
      ),
    );
  }

  Widget showListData() {
    return FutureBuilder<List<Todos>>(
      future: todosRepository.getTodos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var todos = snapshot.data?[index];
                return ItemTodos(
                    id: todos?.id ?? "$index",
                    completed: todos?.completed ?? false,
                    title: todos?.title ?? "",
                    dueDate: todos?.dueDate != null ? DateFormat("dd MMM yyyy").format(todos!.dueDate!) : "");
              });
        }

        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${snapshot.error}"),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Refresh"))
            ],
          );
        }
        return Container();
      },
    );
  }
}
