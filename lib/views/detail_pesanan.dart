import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/models/pesanan_model.dart';

class DetailPesanan extends StatelessWidget {
  const DetailPesanan({super.key});

  @override
  Widget build(BuildContext context) {
    final PesananModel model = Get.arguments;
    return Scaffold(
      body: Center(child: Text(model.nama!)),
    );
  }
}
