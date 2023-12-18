import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/models/pesanan_model.dart';

class CardPesanan extends StatelessWidget {
  final PesananModel model;

  const CardPesanan({super.key, required this.model});

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime tanggalPesan = DateTime.parse(model.createdAt!);
    DateTime tanggalJadi = tanggalPesan.add(Duration(days: model.estimasi!));
    String stringTanggalPesan =
        "${tanggalPesan.day} ${getMonthName(tanggalPesan.month)} ${tanggalPesan.year}";
    String stringTanggalJadi =
        "${tanggalJadi.day} ${getMonthName(tanggalJadi.month)} ${tanggalJadi.year}";
    return GestureDetector(
      onTap: () {
        Get.toNamed('/detail_pesanan', arguments: model);
      },
      child: Container(
        color: const Color(0xffEFEFEF),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Nama'),
                Text(model.nama!),
              ],
            ),
            const SizedBox(
                width: 70,
                height: 30,
                child: Image(image: AssetImage("assets/status_card.png"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('No. Nota'),
                    Text('ID-${model.id!.toString()}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Total harga'),
                    Text('Rp${model.harga!.toString()}'),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tanggal pesanan'),
                    Text(stringTanggalPesan),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Estimasi selesai'),
                    Text(stringTanggalJadi),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
