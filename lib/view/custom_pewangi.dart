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
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: GridView.count(
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
              ),
            ],
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
      bottomSheet: SizedBox(
        width: double.infinity - 10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, foregroundColor: Colors.white),
          onPressed: () {
            if (controller.pilihan.value == "") {
              null;
            } else {
              Get.back();
            }
          },
          child: const Text("Lanjutkan"),
        ),
      ),
    );
  }
}
