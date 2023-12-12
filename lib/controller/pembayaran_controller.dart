import 'package:get/get.dart';

import '../components/card_pewangi.dart';

class PembayaranController extends GetxController {
  var pilihan = "".obs;

  List<CardPewangi> listPewangi = [
    const CardPewangi(nama: 'Fresh Ocean', foto: 'assets/fresh-ocean.jpg'),
    const CardPewangi(nama: 'Candy', foto: 'assets/candy.jpg'),
    const CardPewangi(nama: 'Coffee Cream', foto: 'assets/coffee.jpg'),
    const CardPewangi(nama: 'Sakura', foto: 'assets/sakura.jpg'),
    const CardPewangi(nama: 'Strawberry', foto: 'assets/stroberi.jpg'),
    const CardPewangi(nama: 'Jasmine', foto: 'assets/jasmine.png'),
  ];

  void setPilihanPewangi($index) {
    pilihan.value = listPewangi[$index].nama;
  }

  void clearPilihanPewangi() {
    pilihan.value = "";
  }

  List<CardPewangi> getListPewangi() {
    return listPewangi;
  }
}
