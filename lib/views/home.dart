import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/controller/pesanan_controller.dart';
import 'package:mvp/controller/pewangi_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PewangiController>();
    Get.find<PesananController>();
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
                  Get.toNamed('/form_pemesanan');
                },
                child: const Text('Pegawai'),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Get.toNamed('/menu_pemilik');
                },
                child: const Text('Pemilik',
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
