import 'package:flutter/material.dart';

class CardPewangi extends StatelessWidget {
  final String nama, foto;
  const CardPewangi({super.key, required this.nama, required this.foto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(foto),
          // colorFilter: ColorFilter.mode(
          //     Colors.white.withOpacity(0.5), BlendMode.modulate),
        ),
      ),
      child: Center(
          child: Text(
        nama,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      )),
    );
  }
}
