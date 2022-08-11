import 'package:get/get.dart';
import 'package:new_cvsender/db/db_helper.dart';
import 'package:new_cvsender/models/task.dart';

class TaskController extends GetxController {
  @override
  void onRady() {
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task: task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper.delete(task);
  }

  void updateTask(int id) async {
    await DBHelper.update(id);
  }
}
