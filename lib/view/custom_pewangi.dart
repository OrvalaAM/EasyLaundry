import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/card_pewangi.dart';
import '../controller/pembayaran_controller.dart';

// ignore: must_be_immutable
class CustomPewangi extends GetView<PembayaranController> {
  List<CardPewangi> listPewangi = [];

  CustomPewangi({super.key});
  @override
  Widget build(BuildContext context) {
    listPewangi = controller.getListPewangi();
    return Scaffold(
      body: ListView(
        children: <Widget>[
          GridView.count(
            crossAxisCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(listPewangi.length, (index) {
              return GestureDetector(
                onTap: () => controller.setPilihanPewangi(index),
                child: listPewangi[index],
              );
            }),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: const Color(0xffEFEFEF),
            child: Obx((() => Text(controller.pilihan.value == ""
                ? ""
                : 'Pilihan: ${controller.pilihan}'))),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.back();
      //   },
      // ),
      bottomSheet: ElevatedButton(
        child: Text("Lanjutkan"),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
