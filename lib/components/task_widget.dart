import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/task_view.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TextEditingController teskEditingControllerForTitle = TextEditingController();
  TextEditingController testEditingControllerForSubTitle =
      TextEditingController();

  @override
  void initState() {
    teskEditingControllerForTitle.text = widget.task.title;
    testEditingControllerForSubTitle.text = widget.task.subTitle;
    super.initState();
  }

  void dispose() {
    teskEditingControllerForTitle.dispose();
    testEditingControllerForSubTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Tasks Details
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (ctx) => TaskView(
                      task: widget.task,
                      titleTaskController: teskEditingControllerForTitle,
                      descrptionTaskController:
                          testEditingControllerForSubTitle,
                    )));
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: widget.task.isCompleted
                ? Color.fromRGBO(154, 184, 222, 1)
                : Color.fromRGBO(244, 237, 201, 1),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: const Offset(0, 1),
                  blurRadius: 1),
            ]),
        duration: const Duration(milliseconds: 600),
        child: ListTile(
          //check icon
          leading: GestureDetector(
            onTap: () {
              //check or not check task
              widget.task.isCompleted = !widget.task.isCompleted;
              widget.task.save();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                color: widget.task.isCompleted
                    ? Color.fromRGBO(248, 211, 78, 1)
                    : const Color.fromRGBO(154, 184, 222, 1),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: Icon(
                Icons.check,
                color: const Color.fromRGBO(154, 184, 222, 1),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 3),
            child: Text(
              teskEditingControllerForTitle.text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  decoration: widget.task.isCompleted
                      ? TextDecoration.lineThrough
                      : null),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                testEditingControllerForSubTitle.text,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
