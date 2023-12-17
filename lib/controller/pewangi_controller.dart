import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvp/controller/pesanan_controller.dart';
import 'package:mvp/database_instance.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class PewangiController extends GetxController {
  DatabaseInstance db = DatabaseInstance();
  TextEditingController namaParfumController = TextEditingController();
  Directory? directory;
  String repo = '';
  File? selectedImage;
  var path = "".obs;
  var pilihan = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(Duration.zero, () async {
      await db.database();
      directory = await getExternalStorageDirectory();
      repo = "${directory!.path}/EasyLaundry/pewangi/";
      directory = Directory(repo);
      if (!await directory!.exists()) {
        await directory!.create(recursive: true);
      }
    });
  }

  Future pickImageFromGalery() async {
    // if (await _requestPermission(Permission.storage)) {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    print(returnedImage.path);
    path.value = returnedImage.path;
    selectedImage = File(returnedImage.path);
    // }
  }

  void setPilihanPewangi(nama) {
    pilihan.value = nama;
  }

  void setFixPewangi() {
    final controllerPesanan = Get.find<PesananController>();
    controllerPesanan.pilihan.value = pilihan.value;
  }

  Future<bool> saveFile(String nama) async {
    try {
      if (await directory!.exists()) {
        String fileName = path.value.split('/').last;
        String namaBaru = '$repo/$nama';
        File destinationFile = File('$repo/$fileName');
        await selectedImage!.copy(destinationFile.path);
        destinationFile = await destinationFile.rename(namaBaru);
      }
      print('sukses buat folder');
    } catch (e) {
      print(e);
    }
    return false;
  }

  void addPewangi() async {
    String foto = namaParfumController.text.replaceAll(' ', '-');
    foto = '$foto${p.extension(path.value)}';
    db.insertPewangi({
      'nama': namaParfumController.text,
      'foto': foto,
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    }).then((response) => Get.back());
    await saveFile(foto);
  }

  // Future<bool> _requestPermission(Permission permission) async {
  //   if (await permission.isGranted) {
  //     return true;
  //   } else {
  //     var result = await permission.request();
  //     if (result == PermissionStatus.granted) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  // }
}
