import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_app/app_str.dart';
import 'package:task_app/components/rep_textfileld.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/extensions/space_exs.dart';
import 'package:task_app/main.dart';
import 'package:task_app/models/task.dart';

class TaskView extends StatefulWidget {
  TaskView({
    super.key,
    required this.task,
    required this.titleTaskController,
    required this.descrptionTaskController,
    // required taskControllerForSubtitle,
    // required taskControllerForTitle
  });

  final TextEditingController? titleTaskController;
  final TextEditingController? descrptionTaskController;
  final Task? task;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  var title;
  var subTitle;

  bool isTaskAlreadyExist() => (widget.titleTaskController?.text == null &&
      widget.descrptionTaskController?.text == null);

  dynamic isTaskAlreadyExistUpdateOtherWiseCreate() {
    if (widget.titleTaskController?.text != null &&
        widget.titleTaskController?.text != null) {
      try {
        widget.titleTaskController?.text = title;
        widget.titleTaskController?.text = subTitle;

        widget.task?.save();

        Navigator.pop(context);
      } catch (e) {
        updateTaskWarning(context);
      }
    } else {
      if (title != null && subTitle != null) {
        var task = Task.create(
          title: title,
          subTitle: subTitle,
        );
        BaseWidget.of(context).datastore.addTask(task: task);

        Navigator.pop(context);
      }
    }
  }

  dynamic deleteTask() {
    return widget.task?.delete();
  }

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
                  //Top side Text
                  _buildTopside(
                    isTaskAlreadyExist: isTaskAlreadyExist(),
                  ),
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
                        RepTextFiedl(
                          controller: widget.titleTaskController,
                          onFieldSubmitted: (String inputTitle) {
                            title = inputTitle;
                          },
                          onChanged: (String inputTitle) {
                            title = inputTitle;
                          },
                        ),
                        10.h,
                        RepTextFiedl(
                          controller: widget.descrptionTaskController,
                          isForDescription: true,
                          onFieldSubmitted: (String inputSubTitle) {
                            subTitle = inputSubTitle;
                          },
                          onChanged: (String inputSubTitle) {
                            subTitle = inputSubTitle;
                          },
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        _buildBottomSideBottons(
                          isTaskAlreadyExist: isTaskAlreadyExist(),
                          deleteTask: deleteTask(),
                          isTaskAlreadyExistUpdateOtherWiseCreate:
                              isTaskAlreadyExistUpdateOtherWiseCreate(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class _buildBottomSideBottons extends StatelessWidget {
  final bool isTaskAlreadyExist;

  final deleteTask;

  final isTaskAlreadyExistUpdateOtherWiseCreate;

  const _buildBottomSideBottons({
    required this.isTaskAlreadyExist,
    required this.deleteTask,
    required this.isTaskAlreadyExistUpdateOtherWiseCreate,
  });

  Widget build(BuildContext context) {
    // Widget _buildBottomSideBottons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: isTaskAlreadyExist
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        children: [
          isTaskAlreadyExist
              ? Container()
              :
              //delet current task
              MaterialButton(
                  onPressed: () {
                    deleteTask();
                    Navigator.pop(context);
                  },
                  minWidth: 150,
                  color: Color.fromRGBO(0, 202, 131, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
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
              isTaskAlreadyExistUpdateOtherWiseCreate();
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
}

class _buildTopside extends StatelessWidget {
  final bool isTaskAlreadyExist;

  const _buildTopside({
    required this.isTaskAlreadyExist,
  });
  Widget build(BuildContext context) {
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
                text: isTaskAlreadyExist
                    ? AppStr.AddNewTask
                    : AppStr.updateCurrentTask,
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
