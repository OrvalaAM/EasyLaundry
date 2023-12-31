import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/controller/pesanan_controller.dart';

class ButtonClearPewangi extends StatelessWidget {
  const ButtonClearPewangi({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PesananController());
    return GestureDetector(
      onTap: controller.clearPilihanPewangi,
      child: const SizedBox(
        height: 20,
        width: 20,
        child: Icon(Icons.clear),
      ),
    );
  }
}
