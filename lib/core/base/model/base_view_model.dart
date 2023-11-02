import 'package:enelsis/core/init/navigation/get_navigation_Service.dart';
import 'package:enelsis/core/init/navigation/inavigation_service.dart';
import 'package:enelsis/core/init/network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseViewModel extends GetxController {
  late BuildContext viewModelContext;

  INavgiationService navigation = GetNavigationService.instance;
  NetworkManager networkManagerInstance = NetworkManager.instance!;
  void setContext(BuildContext context);
  void init();
}
