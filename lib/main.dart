import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/sample_binding.dart';
import 'package:mvp/views/custom_pewangi.dart';
import 'package:mvp/views/daftar_pesanan.dart';
import 'package:mvp/views/form_pesanan.dart';
import 'package:mvp/views/pembayaran.dart';
import 'package:mvp/views/tambah_pewangi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/pembayaran',
      getPages: [
        GetPage(
          name: '/pembayaran',
          page: () => const Pembayaran(),
          binding: SampleBind(),
        ),
        GetPage(
          name: '/custom_pewangi',
          page: () => CustomPewangi(),
          binding: SampleBind(),
        ),
        GetPage(
          name: '/form_pemesanan',
          page: () => FormPesanan(),
          binding: SampleBind(),
        ),
        GetPage(
          name: '/tambah_pewangi',
          page: () => TambahPewangi(),
          binding: SampleBind(),
        ),
        GetPage(
          name: '/daftar_pesanan',
          page: () => const DaftarPesanan(),
          binding: SampleBind(),
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
