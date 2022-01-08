// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_mobile/database_helper.dart';
import 'package:todo_mobile/models/task.dart';
import 'package:todo_mobile/widgets.dart';

class TaskPage extends StatefulWidget {
  // const TaskPage({ Key? key }) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/back_arrow_icon.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              onSubmitted: (value) async {
                                // print(value);

                                if (value != "") {
                                  DatabaseHelper _dbHelper = DatabaseHelper();

                                  Task _newTask = Task(
                                      title: value,
                                  );

                                  await _dbHelper.insertTask(_newTask);

                                  print("New task has been created");
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Task Title',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.0,
                                ),
                              ),
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF211551)),
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Task Description',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TodoWidget(
                    text: 'Todo',
                  ),
                  TodoWidget(),
                  TodoWidget(),
                  TodoWidget(),
                  TodoWidget(),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFE3577),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/delete_icon.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
