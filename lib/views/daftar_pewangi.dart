import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/components/card_hapus_pewangi.dart';
import 'package:mvp/components/card_pewangi.dart';
import 'package:mvp/controller/pewangi_controller.dart';
import 'package:mvp/models/pewangi_model.dart';

class DaftarPewangi extends GetView<PewangiController> {
  const DaftarPewangi({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        controller.hapus.value = false;
      },
      child: Scaffold(
        body: FutureBuilder<List<PewangiModel>>(
          future: controller.db.getAllPewangi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("Tidak ada pewangi"),
                );
              }
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(snapshot.data!.length, (index) {
                    return Obx(
                      () {
                        return GestureDetector(
                          onTap: () => controller
                              .setPilihanPewangi(snapshot.data![index].nama),
                          child: controller.hapus.value
                              ? CardHapusPewangi(model: snapshot.data![index])
                              : CardPewangi(model: snapshot.data![index]),
                        );
                      },
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
        bottomSheet: Row(
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white),
                onPressed: () {
                  Get.toNamed('/tambah_pewangi');
                },
                child: const Text("Tambah pewangi"),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                onPressed: () {
                  controller.modeHapus();
                },
                child: const Icon(Icons.delete),
              ),
            )
          ],
        ),
      ),
    );
  }
}
