import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../controller/pembayaran_controller.dart';

class ButtonSetPewangi extends StatelessWidget {
  const ButtonSetPewangi({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(PembayaranController());
    return GestureDetector(
      child: const SizedBox(
        height: 20,
        width: 20,
        child: Icon(Icons.add),
      ),
      onTap: () {
        Get.toNamed('/custom_pewangi');
      },
    );
  }
}
