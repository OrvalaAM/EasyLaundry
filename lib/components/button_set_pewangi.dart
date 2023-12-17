import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/controller/pewangi_controller.dart';

class ButtonSetPewangi extends StatelessWidget {
  const ButtonSetPewangi({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const SizedBox(
        height: 20,
        width: 20,
        child: Icon(Icons.add),
      ),
      onTap: () {
        final controllerPewangi = Get.find<PewangiController>();
        controllerPewangi.pilihan.value = '';
        Get.toNamed('/custom_pewangi');
      },
    );
  }
}
