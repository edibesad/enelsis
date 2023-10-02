import 'dart:core';

abstract class AbstractService {
  Future<String> fetchUsers();
  Future<String> fetchDepartments();
  Future<String> fetchMachines();
  Future<String> fetchTasks();
  Future<String> fetchTasksByMachineId(int id);
  Future<String> fetchActiveTaskByMachineId(int id);
}
