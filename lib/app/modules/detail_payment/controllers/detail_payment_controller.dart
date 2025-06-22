import 'package:get/get.dart';

class DetailPaymentController extends GetxController {
  //TODO: Implement DetailPaymentController
  final Map<String, dynamic> paymentDetail = {
    'year': '2024',
    'amount': '1000',
    'status': 'Paid',
    'date': '2024-06-01',
    'invoiceImage': 'https://weinvoice.io/images/weinvoice-template-05.jpg',
  };

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
