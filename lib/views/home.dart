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
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/form_pemesanan');
              },
              child: Text('Pegawai'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/daftar_pesanan');
              },
              child: Text('Pemilik'),
            )
          ],
        ),
      ),
    );
  }
}
