import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_app/app_str.dart';
import 'package:task_app/components/rep_textfileld.dart';
import 'package:task_app/extensions/space_exs.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descrptionTaskController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          backgroundColor: Color.fromRGBO(244, 237, 201, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(244, 237, 201, 1),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTopside(),
                  SizedBox(
                    width: double.infinity,
                    height: 530,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            AppStr.titleOftitleTextField,
                            style: TextStyle(),
                          ),
                        ),
                        RepTextFiedl(controller: titleTaskController),
                        10.h,
                        RepTextFiedl(
                          controller: descrptionTaskController,
                          isForDescription: true,
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        _buildBottomSideBottons()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildBottomSideBottons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //delet current task
          MaterialButton(
            onPressed: () {
              log("Current Task Has Been Deleted!");
            },
            minWidth: 150,
            color: Color.fromRGBO(0, 202, 131, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            height: 55,
            child: Row(
              children: [
                Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                5.w,
                const Text(
                  AppStr.deleteTask,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          //add or update task

          MaterialButton(
            onPressed: () {
              //add task update task
              log("New Task Has Been Added!");
            },
            minWidth: 150,
            color: Color.fromRGBO(0, 202, 131, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            height: 55,
            child: Row(
              children: [
                const Text(
                  AppStr.AddTaskString,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopside() {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          ),
          RichText(
            text: TextSpan(
                text: "Add New ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w300),
                children: [
                  TextSpan(
                      text: AppStr.TaskString,
                      style: TextStyle(fontWeight: FontWeight.w400))
                ]),
          ),
          const SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
