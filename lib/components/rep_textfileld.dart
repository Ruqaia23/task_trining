import 'package:flutter/material.dart';
import 'package:task_app/app_str.dart';

class RepTextFiedl extends StatelessWidget {
  const RepTextFiedl(
      {super.key,
      required this.controller,
      this.isForDescription = false,
      required this.onFieldSubmitted,
      required this.onChanged});

  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool isForDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDescription ? 6 : null,
          cursorHeight: !isForDescription ? 60 : null,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: isForDescription ? InputBorder.none : null,
            counter: Container(),
            hintText: isForDescription ? AppStr.addNote : null,
            prefixIcon: isForDescription
                ? Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                  )
                : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
