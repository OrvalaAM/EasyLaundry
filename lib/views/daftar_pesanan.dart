import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/controller/pesanan_controller.dart';
import 'package:mvp/models/pesanan_model.dart';

class DaftarPesanan extends GetView<PesananController> {
  const DaftarPesanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PesananModel>>(
        future: controller.db.getAllPesanan(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Tidak ada pesanan"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].nama ?? ''),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
