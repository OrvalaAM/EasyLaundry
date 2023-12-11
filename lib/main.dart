import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/components/card_pewangi.dart';
import 'package:mvp/controller/pembayaran_controller.dart';
import 'package:mvp/view/custom_pewangi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(PembayaranController());

  List<CardPewangi> listPewangi = [];

  @override
  Widget build(BuildContext context) {
    return CustomPewangi();
  }
}
