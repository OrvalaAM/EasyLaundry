import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/components/button_clear_pewangi.dart';
import 'package:mvp/components/button_set_pewangi.dart';

import '../controller/pembayaran_controller.dart';

class Pembayaran extends GetView<PembayaranController> {
  const Pembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const Text(
            "Konfirmasi pesanan anda",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.grey,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detail pesanan:",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Cuci dan setrika",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )),
                    Text(
                      "10 kg",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.grey,
            child: Row(
              children: [
                Expanded(
                    child: Obx((() => Text(
                          controller.pilihan.value == ""
                              ? 'Parfum: Silakan pilih jenis parfum anda'
                              : 'Parfum: ${controller.pilihan}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        )))),
                Obx((() => controller.pilihan.value == ""
                    ? const ButtonSetPewangi()
                    : const ButtonClearPewangi())),
              ],
            ),
          ),
          Container(
            // margin: const EdgeInsets.only(top: 30),
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            padding: const EdgeInsets.all(10),
            color: Colors.grey,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumlah pembayaran",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Rp10.000",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
                Text(
                  "Pembayaran",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            child: const Row(
              children: [
                Expanded(
                    child: Text(
                  "Nominal pembayaran",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                )),
                Text(
                  "Rp10.000",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    "Kode unik",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  "+Rp528",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Total nominal",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.grey,
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  "Rp10.528",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                )),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.white, // Warna latar belakang tombol (putih)
                    foregroundColor: Colors.blue, // Warna teks tombol (biru)
                    side: const BorderSide(
                        color: Colors.blue), // Warna border (biru)
                  ),
                  child: const Text(
                    "Salin",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 8,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          const Image(
            image: AssetImage("assets/icons/tiga_digit.png"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Expanded(
                child: Row(children: [
                  const Image(image: AssetImage("assets/icons/dompet.png")),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Isi saldo dengan metode",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Pilih metode isi saldo",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              const Image(image: AssetImage("assets/icons/more.png")),
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/form_pemesanan');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
