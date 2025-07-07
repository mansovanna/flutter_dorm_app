import 'package:final_dromitory/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class ApiBinding extends Bindings {
  @override
  void dependencies() {
    // Bind your API provider here
    // Get.lazyPut<ApiProvider>(() => ApiProvider());
    // Example: Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.put(ApiProvider());
    // , permanent: true
  }
}
// You can also bind other services or controllers related to API here
// For example, if you have a controller that uses the ApiProvider, you can bind it