import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:task_app/app_str.dart';

dynamic updateTaskWarning(BuildContext context) {
  return FToast.toast(context,
      msg: AppStr.oopsMsg,
      subMsg: "you ust edit the tasks then try to update it !",
      corner: 20.0,
      duration: 3000,
      padding: const EdgeInsets.all(20));
}
