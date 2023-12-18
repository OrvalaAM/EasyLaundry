import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/database_instance.dart';

class PesananController extends GetxController {
  DatabaseInstance db = DatabaseInstance();
  TextEditingController namaController = TextEditingController();
  TextEditingController hpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController jenisLayananController = TextEditingController();
  TextEditingController namaLayananController = TextEditingController();
  TextEditingController kuantitasController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController estimasiController = TextEditingController();
  List<String> list = <String>['Cuci Setrika', 'Cuci', 'Setrika'];
  var pewangi = "".obs;
  int subTotal = 0;
  int kodeUnik = 0;
  int total = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(Duration.zero, () async {
      await db.database();
    });
  }

  void clearPilihanPewangi() {
    pewangi.value = "";
  }

  void processTotal() {
    subTotal =
        (int.parse(kuantitasController.text) * int.parse(hargaController.text))
            .round();
    kodeUnik = Random().nextInt(999) + 1;
    total = subTotal + kodeUnik;
  }

  void addPesanan() {
    db.insertPesanan({
      'nama': namaController.text,
      'no_hp': hpController.text,
      'alamat': alamatController.text,
      'jenis_layanan': jenisLayananController.text,
      'nama_layanan': namaLayananController.text,
      'kuantitas': kuantitasController.text,
      'harga': hargaController.text,
      'estimasi': estimasiController.text,
      'subtotal': subTotal,
      'kode_unik': kodeUnik,
      'total': total,
      'pewangi': pewangi.value,
      'created_at': DateTime.now().toString(),
      'finished_at': DateTime.now()
          .add(Duration(days: int.parse(estimasiController.text)))
          .toString(),
      'updated_at': DateTime.now().toString(),
    }).then((response) => Get.toNamed('/daftar_pesanan'));
  }
}
