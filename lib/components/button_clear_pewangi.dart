import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/pembayaran_controller.dart';

class ButtonClearPewangi extends StatelessWidget {
  const ButtonClearPewangi({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PembayaranController());
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
