// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {required this.taskTitle,
      required this.checkboxCallback,
      required this.longPressCallback,
      this.isChecked = false});

  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) checkboxCallback;
  void Function()? longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
    );
  }
}

// class TaskCheckBox extends StatelessWidget {
//   final bool checkBoxState;
//   final void Function(bool?) toggleCheckBoxState;
//
//   TaskCheckBox({required this.checkBoxState, required this.toggleCheckBoxState});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkBoxState,
//       onChanged: toggleCheckBoxState,
//       activeColor: Colors.lightBlueAccent,
//     );
//   }
// }

// TaskCheckBox(
// checkBoxState: isChecked,
// toggleCheckBoxState: (bool? checkBoxState) {
// setState(() {
// isChecked = checkBoxState!;
// });
// },
// ),
