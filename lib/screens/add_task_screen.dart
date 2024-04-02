// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomate/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.0),
            TextField(
              cursorColor: Colors.lightBlueAccent,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(height: 4.0),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () {
                if (newTaskTitle == '') {
                  double w = MediaQuery.of(context).size.width;
                  final snackBar = SnackBar(
                    // margin: EdgeInsets.all(10.0),
                    // behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.lightBlueAccent,
                    duration: Duration(seconds: 1),
                    content: Center(
                        child: Text(
                      'Task name cannot be empty',
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    )),
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                }
              },
              child: Center(
                  child: Text(
                'Add',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
