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
  var pilihan = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(Duration.zero, () async {
      await db.database();
    });
  }

  void clearPilihanPewangi() {
    pilihan.value = "";
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
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    }).then((response) => Get.toNamed('/daftar_pesanan'));
  }
}
