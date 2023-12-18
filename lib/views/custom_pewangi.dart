import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/controller/pewangi_controller.dart';

import '../components/card_pewangi.dart';
import '../models/pewangi_model.dart';

class CustomPewangi extends GetView<PewangiController> {
  const CustomPewangi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FutureBuilder<List<PewangiModel>>(
            future: controller.db.getAllPewangi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("Tidak ada pewangi"),
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: GridView.count(
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(snapshot.data!.length, (index) {
                      return GestureDetector(
                        onTap: () => controller
                            .setPilihanPewangi(snapshot.data![index].nama),
                        child: CardPewangi(model: snapshot.data![index]),
                      );
                    }),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(
              () => Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 70),
                padding: const EdgeInsets.all(10),
                color: controller.pilihan.value == ""
                    ? Colors.transparent
                    : const Color(0xffEFEFEF),
                child: Text(
                  controller.pilihan.value == ""
                      ? ""
                      : 'Terpilih: ${controller.pilihan}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.toNamed('/tambah_pewangi');
      //   },
      //   child: Icon(Icons.add),
      // ),
      bottomSheet: SizedBox(
        width: double.infinity - 10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, foregroundColor: Colors.white),
          onPressed: () {
            if (controller.pilihan.value == "") {
              null;
            } else {
              controller.setFixPewangi();
              Get.back();
            }
          },
          child: const Text("Lanjutkan"),
        ),
      ),
    );
  }
}
