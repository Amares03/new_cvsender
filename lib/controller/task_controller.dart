import 'package:get/get.dart';
import 'package:new_cvsender/db/db_helper.dart';
import 'package:new_cvsender/models/task.dart';

class TaskController extends GetxController {
  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task: task);
  }
}
