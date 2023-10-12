import 'dart:core';

abstract class AbstractService {
  Future<String> fetchUsers();

  Future<String> fetchDepartments();

  Future<String> fetchMachines();
  Future<String> fetchMachinesByType(int id);
  Future<String> fetchMachinesByTypes(List<int> ids);

  Future<String> fetchTasks();
  Future<String> fetchTasksByMachineId(int id);
  Future<String> fetchActiveTaskByMachineId(int id);

  Future<String> fetchProducts();

  Future<String> fetchItemByInput(int board, int order, int productId);
  Future<String> fetchItemByID(int id);
  Future<String> fetchItemByName(String query);
  Future<String> fetchItemHistory();
}
