import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/components/button_clear_pewangi.dart';
import 'package:mvp/components/button_set_pewangi.dart';
import 'package:mvp/controller/pesanan_controller.dart';
import 'package:intl/intl.dart';

class Pembayaran extends GetView<PesananController> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
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
                      controller.jenisLayananController.text,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )),
                    Text(
                      '${controller.kuantitasController.text} kg',
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
                          controller.pewangi.value == ""
                              ? 'Parfum: Silakan pilih jenis parfum anda'
                              : 'Parfum: ${controller.pewangi}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        )))),
                Obx((() => controller.pewangi.value == ""
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
            child: Column(
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
                  'Rp${NumberFormat.decimalPattern().format(controller.subTotal)}',
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
            child: Row(
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
                  'Rp${NumberFormat.decimalPattern().format(controller.subTotal)}',
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
            child: Row(
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
                  '+Rp${controller.kodeUnik}',
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
                Expanded(
                    child: Text(
                  'Rp${NumberFormat.decimalPattern().format(controller.total)}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                )),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    side: const BorderSide(color: Colors.blue),
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
      bottomSheet: SizedBox(
        width: double.infinity - 10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, foregroundColor: Colors.white),
          onPressed: () {
            if (controller.pewangi.value == "") {
              null;
            } else {
              Get.back();
            }
          },
          child: const Text("Lanjutkan"),
        ),
      ),
    );
  }
}
