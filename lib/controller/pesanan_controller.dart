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

  @override
  Future<void> onInit() async {
    // db.database().then((value) {
    //   super.onInit();
    // });
    super.onInit();
    await Future.delayed(Duration.zero, () async {
      await db.database();
    });
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   db.database();
  // }

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
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    }).then((response) => Get.toNamed('/daftar_pesanan'));
  }
}
