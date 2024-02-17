import 'package:api_calling_getx/models/postmodel.dart';
import 'package:api_calling_getx/services/remote_services.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController{

   var isLoading = true.obs;
  var productList = <Temperatures>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products.isNotEmpty) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
