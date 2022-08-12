import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/theme.dart';

class NotifiedPage extends StatelessWidget {
  final String? lable;
  const NotifiedPage({Key? key, required this.lable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? Colors.grey.shade300 : Colors.black,
          ),
        ),
        title: Text(
          lable.toString().split("|")[0],
          style: TextStyle(
              color: Get.isDarkMode ? Colors.grey[300] : Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Get.isDarkMode ? darkHeaderClr : primaryClr),
          child: Center(
            child: Text(
              lable.toString().split("|")[1],
              style: headingStyle.copyWith(color: Colors.grey[300]),
            ),
          ),
        ),
      ),
    );
  }
}
