import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/models/pesanan_model.dart';
import 'package:intl/intl.dart';

class DetailPesanan extends StatelessWidget {
  const DetailPesanan({super.key});

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
    final PesananModel model = Get.arguments;
    DateTime tanggalPesan = DateTime.parse(model.createdAt!);
    DateTime tanggalJadi = tanggalPesan.add(Duration(days: model.estimasi!));
    String stringTanggalPesan =
        "${tanggalPesan.day} ${getMonthName(tanggalPesan.month)} ${tanggalPesan.year}";
    String stringTanggalJadi =
        "${tanggalJadi.day} ${getMonthName(tanggalJadi.month)} ${tanggalJadi.year}";
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: const Color(0xffEFEFEF),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Customer'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Nama'),
                        Text(model.nama!),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('No. Handphone'),
                        Text(model.noHp!),
                      ],
                    ),
                  ]),
            ),
            Image(
              image: AssetImage('assets/kirim_via.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              color: const Color(0xffEFEFEF),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Status pesanan'),
                    Image(
                      image: AssetImage('assets/status_detail.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('No. Nota'),
                        Text('ID-${model.id!.toString()}'),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Estimasi selesai'),
                            Text(stringTanggalJadi),
                          ],
                        )
                      ],
                    )
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              color: const Color(0xffEFEFEF),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rincian pesanan'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Layanan'),
                            Text(model.jenisLayanan!),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Kuantitas'),
                            Text('${model.kuantitas!} kg'),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Jenis parfum'),
                        Text(model.pewangi!),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Subtotal'),
                            const Text('Kode unik'),
                            const Text('Total'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Rp${NumberFormat.decimalPattern().format(model.subtotal)}'),
                            Text(
                                'Rp${NumberFormat.decimalPattern().format(model.kodeUnik)}'),
                            Text(
                                'Rp${NumberFormat.decimalPattern().format(model.total)}'),
                          ],
                        ),
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
