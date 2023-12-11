import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/card_pewangi.dart';
import '../controller/pembayaran_controller.dart';

// ignore: must_be_immutable
class CustomPewangi extends StatelessWidget {
  final controller = Get.put(PembayaranController());

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
            color: Colors.red,
            child: Center(child: Obx((() => Text('${controller.pilihan}')))),
          )
        ],
      ),
    );
  }
}
