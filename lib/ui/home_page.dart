import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_cvsender/services/notification_services.dart';
import 'package:new_cvsender/services/theme_sevices.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    // listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: const [
          Text(
            "Team data",
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () async {
          ThemeServices().switchTheme();
          await service.showNotification(
              id: 0,
              title: 'theme change',
              body: Get.isDarkMode
                  ? 'Activated Light Mode'
                  : 'Activated Dark Mode');
          await service.showScheduledNotification(
              id: 1, title: "after", body: "some seconds", seconds: 5);
        },
        child: const Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: const [
        Icon(
          Icons.person,
          size: 20,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
