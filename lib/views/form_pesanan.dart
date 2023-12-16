import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvp/controller/pesanan_controller.dart';

class FormPesanan extends GetView<PesananController> {
  const FormPesanan({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextField(
              controller: controller.namaController,
              decoration: const InputDecoration(
                  hintText: "Nama",
                  icon: Icon(Icons.person),
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextField(
              controller: controller.hpController,
              decoration: const InputDecoration(
                  hintText: "No. Handphone",
                  icon: Icon(Icons.call),
                  border: InputBorder.none),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text(
                "*Untuk kirim nota via Whatsapp/pesan",
                style: TextStyle(color: Colors.grey),
              )),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextField(
              controller: controller.alamatController,
              decoration: const InputDecoration(
                  hintText: "Alamat (opsional)",
                  icon: Image(image: AssetImage("assets/icons/location.png")),
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: DropdownMenu(
              controller: controller.jenisLayananController,
              hintText: "Jenis Layanan",
              width: MediaQuery.of(context).size.width - 20,
              leadingIcon: const Image(
                image: AssetImage("assets/icons/jenis_layanan.png"),
              ),
              dropdownMenuEntries: controller.list
                  .map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextField(
              controller: controller.namaLayananController,
              decoration: const InputDecoration(
                  hintText: "Nama Layanan",
                  icon: Image(
                      image: AssetImage("assets/icons/washing_machine.png")),
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextField(
              controller: controller.kuantitasController,
              decoration: const InputDecoration(
                  hintText: "Kuantitas",
                  icon: Image(image: AssetImage("assets/icons/quantity.png")),
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextField(
              controller: controller.hargaController,
              decoration: const InputDecoration(
                  hintText: "Harga",
                  icon: Image(image: AssetImage("assets/icons/price.png")),
                  border: InputBorder.none),
            ),
          ),
          Row(children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(left: 5),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: controller.estimasiController,
                  decoration: const InputDecoration(
                      hintText: "Estimasi",
                      icon:
                          Image(image: AssetImage("assets/icons/estimasi.png")),
                      border: InputBorder.none),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: DropdownMenu(
                controller: controller.jenisLayananController,
                hintText: "Hari",
                dropdownMenuEntries: controller.list
                    .map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
          ]),
          ElevatedButton(
              onPressed: () => controller.addPesanan(),
              child: Text('Buat pesanan'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/daftar_pesanan');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
