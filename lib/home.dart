import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/app_str.dart';
import 'package:task_app/components/task_widget.dart';
import 'package:task_app/extensions/space_exs.dart';
import 'package:task_app/task_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> tasting = [2, 323, 23];
  @override
  Widget build(BuildContext context) {
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
              context, CupertinoPageRoute(builder: (_) => TaskView()));
        },
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 202, 131, 1),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: _bulidHomeBody(),
    );
  }

  Widget _bulidHomeBody() {
    return SizedBox(
        width: double.infinity,
        height: 745,
        child: ListView.builder(
          itemCount: tasting.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, i) {
            return Dismissible(
                direction: DismissDirection.horizontal,
                onDismissed: (_) {},
                background: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete_outlined,
                      color: Colors.grey,
                    ),
                    8.w,
                    Text(
                      AppStr.deletedTask,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                key: Key(
                  i.toString(),
                ),
                child: const TaskWidget());
          },
        ));
  }
}
