import 'package:flutter/material.dart';


class ItemTodos extends StatelessWidget {
  final String id;
  final bool completed;
  final String title;
  final String dueDate;
  final VoidCallback? onEdit;
  final ValueChanged<DismissDirection?>? onDelete;
  final ValueChanged<bool?>? onChangeStatus;

  const ItemTodos(
      {super.key,
      required this.id,
      required this.completed,
      required this.title,
      required this.dueDate,
      this.onEdit,
      this.onChangeStatus,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<String>(id),
      onDismissed: onDelete,
      child: ListTile(
        leading: Checkbox(
          value: completed,
          onChanged: onChangeStatus,
        ),
        title: Text(title),
        subtitle: Text(dueDate),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: onEdit,
        ),
      ),
    );
  }
}
