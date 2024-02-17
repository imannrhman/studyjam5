import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../data/model/todos.dart';

Future<Todos?> showModalBottomForm(context, {Todos? todos}) {
  TextEditingController title = TextEditingController(text: todos?.title ?? "");
  TextEditingController priority =
      TextEditingController(text: "${todos?.priority ?? ""}");
  TextEditingController dueDate = TextEditingController(
      text: todos?.dueDate != null
          ? DateFormat("dd/MM/yyy").format(todos!.dueDate!)
          : null);
  DateTime date = DateTime.now();

  return showModalBottomSheet<Todos>(
      context: context,
      builder: (context) => Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      "Form",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: priority,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    label: Text("Prioriy"),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: dueDate,
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                    ).then((value) {
                      if (value != null) {
                        date = value;
                        dueDate.text = DateFormat("dd/MM/yyy").format(value);
                      }
                    });
                  },
                  decoration: const InputDecoration(
                      label: Text("Due Date"),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.date_range_rounded)),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        Todos(
                          title: title.text,
                          priority: int.parse(priority.text),
                          completed: false,
                          dueDate: date,
                        ),
                      );
                    },
                    child: const Text("Submit"),
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ));
}
