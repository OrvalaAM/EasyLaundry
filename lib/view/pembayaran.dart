import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/components/button_clear_pewangi.dart';
import 'package:mvp/components/button_select_pewangi.dart';

import '../controller/pembayaran_controller.dart';

class Pembayaran extends StatelessWidget {
  const Pembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PembayaranController());
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const Text("Konfirmasi pesanan anda"),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            color: Colors.grey,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Detail pesanan:"),
                Row(
                  children: [
                    Expanded(child: Text("Cuci dan setrika")),
                    Text("10 kg"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            color: Colors.grey,
            child: Row(
              children: [
                Expanded(
                    child: Obx((() => Text(controller.pilihan.value == ""
                        ? 'Parfum: Silakan pilih jenis parfum anda'
                        : 'Parfum: ${controller.pilihan}')))),
                Obx((() => controller.pilihan.value == ""
                    ? const ButtonSetPewangi()
                    : const ButtonClearPewangi())),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(10),
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jumlah pembayaran"),
                Text("Rp10.000"),
                Text("Pembayaran"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
