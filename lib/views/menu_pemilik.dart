import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPemilik extends StatelessWidget {
  const MenuPemilik({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () {
                  Get.toNamed('/daftar_pewangi');
                },
                child: const Text('Custom pewangi'),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Get.toNamed('/daftar_pesanan');
                },
                child: const Text('Daftar pesanan',
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
