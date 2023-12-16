import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/controller/pewangi_controller.dart';

// ignore: must_be_immutable
class TambahPewangi extends GetView<PewangiController> {
  TambahPewangi({super.key});

  TextEditingController namaParfumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const Text(
            "Pilih pewangi untuk laundry anda",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          MaterialButton(
            color: Colors.red,
            onPressed: () {
              controller.pickImageFromGalery();
            },
            child: Text("PICK IMAGE FORM GALERY"),
          ),
          Obx(
            () => controller.path.value != ""
                ? Image.file(controller.selectedImage!)
                : Image(
                    image: AssetImage("assets/gambar_kosong.png"),
                  ),
          ),
          Obx(() => controller.path.value != ""
              ? Text(controller.path.value.split('/').last)
              : Container())
        ],
      ),
    );
  }
}
