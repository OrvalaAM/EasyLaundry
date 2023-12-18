import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/controller/pewangi_controller.dart';
import 'package:mvp/models/pewangi_model.dart';

class CardHapusPewangi extends GetView<PewangiController> {
  final PewangiModel model;
  const CardHapusPewangi({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(
                File(controller.repo + model.foto!),
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
            child: Text(
          model.nama!,
          style: const TextStyle(fontSize: 10, color: Colors.black),
        )),
      ),
      Positioned(
        top: 0,
        left: 0,
        child: IconButton(
          iconSize: 30,
          icon: Icon(Icons.clear_rounded),
          color: Colors.red,
          onPressed: () {},
        ),
      )
    ]);
  }
}
