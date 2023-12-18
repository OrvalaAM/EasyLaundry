import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/controller/pewangi_controller.dart';

class TambahPewangi extends GetView<PewangiController> {
  const TambahPewangi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const Text(
              "Pilih pewangi untuk laundry anda",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Obx(
              () => controller.path.value != ""
                  ? Image.file(
                      controller.selectedImage!,
                      width: 150,
                      height: 150,
                    )
                  : const Image(
                      width: 150,
                      height: 150,
                      image: AssetImage("assets/gambar_kosong.png"),
                    ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(children: [
                MaterialButton(
                  color: const Color(0xffEFEFEF),
                  onPressed: () {
                    controller.pickImageFromGalery();
                  },
                  child: const Text("Pilih gambar"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Obx(() => controller.path.value != ""
                      ? Text(controller.path.value.split('/').last)
                      : const Text('')),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: const Text("Nama parfum: "),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: TextField(
                controller: controller.namaParfumController,
                decoration: null,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: double.infinity - 10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, foregroundColor: Colors.white),
          onPressed: () => controller.addPewangi(),
          child: const Text("Tambah parfum"),
        ),
      ),
    );
  }
}
