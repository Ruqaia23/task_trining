import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:task_app/app_str.dart';
import 'package:task_app/components/task_widget.dart';
import 'package:task_app/main.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/task_view.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
        valueListenable: base.datastore.listenToTask(),
        builder: (ctx, Box<Task> box, Widget? child) {
          var tasks = box.values.toList();
          // tasks.sort((a,b)=>a.createdAtDate.compareTo(b.createdAtDate));
          return Scaffold(
            backgroundColor: Color.fromRGBO(244, 237, 201, 1),
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(244, 237, 201, 1),
              title: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "My Tasks",
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => TaskView(
                      task: null,
                      titleTaskController: null,
                      descrptionTaskController: null,
                    ),
                  ),
                );
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 202, 131, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            body: _buildHomeBody(base: base, tasks: tasks),
          );
        });
  }
}

class _buildHomeBody extends StatelessWidget {
  final BaseWidget base;
  final List<Task> tasks;

  const _buildHomeBody({
    required this.base,
    required this.tasks,
  });
  Widget build(BuildContext context) {
    //
    //Widget _buildHomeBody(BaseWidget base, List<Task> tasks) {
    //

    return SizedBox(
      width: double.infinity,
      height: 500,
      child: tasks.isNotEmpty
          ? ListView.builder(
              itemCount: tasks.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, i) {
                var task = tasks[i];
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (_) {
                    base.datastore.deleteTask(task: task);
                  },
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        AppStr.deletedTask,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  key: Key(task.id),
                  child: TaskWidget(task: task),
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
    );
  }
}
