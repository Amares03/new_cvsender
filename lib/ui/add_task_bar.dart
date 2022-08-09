import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_cvsender/ui/theme.dart';
import 'package:new_cvsender/ui/widget/input_field.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Text(
              "Add Task",
              style: headingStyle,
            ),
            const MyInputField(title: "title", hint: "hint"),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_outlined,
          size: 25,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.png"),
          backgroundColor: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
