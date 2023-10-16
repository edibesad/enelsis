import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouter {
  static final unknownPage = GetPage(
    name: "/unknown",
    page: () => Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("Hata!")),
    ),
  );
}
