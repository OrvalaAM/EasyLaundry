import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/sample_binding.dart';
import 'package:mvp/view/custom_pewangi.dart';
import 'package:mvp/view/pembayaran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Pembayaran(),
    );
  }
}
