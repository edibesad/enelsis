import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Widget> homePage = Rx<Widget>(
    const Center(
      child: Text("Hoş Geldiniz!"),
    ),
  );

  var pageTitle = "Hoşgeldiniz".obs;
}
