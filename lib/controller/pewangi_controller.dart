import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvp/database_instance.dart';
import '../components/card_pewangi.dart';

class PewangiController extends GetxController {
  DatabaseInstance db = DatabaseInstance();

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(Duration.zero, () async {
      await db.database();
    });
  }

  // void onInit() {
  //   db.database();
  //   super.onInit();
  // }

  File? selectedImage;
  var path = "".obs;
  Future pickImageFromGalery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    path.value = returnedImage.path;
    selectedImage = File(returnedImage.path);
  }

  var pilihan = "".obs;

  List<CardPewangi> listPewangi = [
    const CardPewangi(
        nama: 'Fresh Ocean', foto: 'assets/pewangi/fresh-ocean.jpg'),
    const CardPewangi(nama: 'Candy', foto: 'assets/pewangi/candy.jpg'),
    const CardPewangi(nama: 'Coffee Cream', foto: 'assets/pewangi/coffee.jpg'),
    const CardPewangi(nama: 'Sakura', foto: 'assets/pewangi/sakura.jpg'),
    const CardPewangi(nama: 'Strawberry', foto: 'assets/pewangi/stroberi.jpg'),
    const CardPewangi(nama: 'Jasmine', foto: 'assets/pewangi/jasmine.png'),
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
