import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:new_cvsender/controller/task_controller.dart';
import 'package:new_cvsender/models/task.dart';
import 'package:new_cvsender/services/notification_services.dart';
import 'package:new_cvsender/services/theme_sevices.dart';
import 'package:new_cvsender/ui/add_task_bar.dart';
import 'package:new_cvsender/ui/theme.dart';
import 'package:new_cvsender/ui/widget/bottom_sheet_button.dart';
import 'package:new_cvsender/ui/widget/button.dart';
import 'package:new_cvsender/ui/widget/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final LocalNotificationService service;
  final _taskController = Get.put(TaskController());
  // ignore: unused_field
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    _taskController.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          const SizedBox(
            height: 15,
          ),
          _showTasks(),
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(child: Obx(() {
      return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: ((context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(
                              context, _taskController.taskList[index]);
                        },
                        child: TaskTile(_taskController.taskList[index]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }));
    }));
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4),
      height: task.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      color: Get.isDarkMode ? darkGryClr : Colors.white,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
            ),
          ),
          const Spacer(),
          task.isCompleted == 1
              ? Container()
              : BottomSheetButton(
                  bColor: primaryClr,
                  text: "Task Completed",
                  onTap: () {
                    task.isCompleted = 1;
                    Get.back();
                  },
                ),
          const SizedBox(
            height: 10.0,
          ),
          BottomSheetButton(
            bColor: Colors.amber,
            text: "Delete Task",
            onTap: () {
              Navigator.of(context).pop();
              _taskController.delete(task);
            },
          ),
          const Spacer(),
          BottomSheetButton(
            bColor: Colors.white,
            text: "Close",
            isColor: true,
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    ));
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: headingStyle,
              )
            ],
          ),
          MyButton(
            lable: "+ Add Task",
            onTap: () async {
              await Get.to(() => const AddTaskPage());
              _taskController.getTasks();
            },
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () async {
          ThemeServices().switchTheme();
          await service.showNotification(
              title: 'theme change',
              body: Get.isDarkMode
                  ? 'Activated Light Mode'
                  : 'Activated Dark Mode');
          // await service.showScheduledNotification(
          //     id: 1, title: "after", body: "some seconds", seconds: 5);
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
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
