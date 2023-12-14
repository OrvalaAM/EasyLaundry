import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormPemesanan extends StatelessWidget {
  TextEditingController namaController = TextEditingController();
  TextEditingController hpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController jenisLayananController = TextEditingController();
  TextEditingController namaLayananController = TextEditingController();
  TextEditingController kuantitasController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController estimasiController = TextEditingController();

  List<String> list = <String>['Cuci Setrika', 'Cuci', 'Setrika'];
  FormPemesanan({super.key});
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
              controller: namaController,
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
              controller: hpController,
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
              controller: alamatController,
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
              controller: jenisLayananController,
              hintText: "Jenis Layanan",
              width: MediaQuery.of(context).size.width - 20,
              leadingIcon: const Image(
                image: AssetImage("assets/icons/jenis_layanan.png"),
              ),
              dropdownMenuEntries:
                  list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextField(
              controller: namaLayananController,
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
              controller: kuantitasController,
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
              controller: hargaController,
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
                  controller: estimasiController,
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
                controller: jenisLayananController,
                hintText: "Hari",
                dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
