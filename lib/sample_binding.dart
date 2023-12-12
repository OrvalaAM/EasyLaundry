import 'package:get/get.dart';
import 'package:mvp/controller/pembayaran_controller.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranController>(() => PembayaranController());
  }
}
