import 'package:api_calling_getx/models/postmodel.dart';
import 'package:api_calling_getx/services/remote_services.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var productList = <Temperatures>[].obs;
  var filteredProductList = <Temperatures>[].obs;

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
        productList.assignAll(products);
        filteredProductList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredProductList.assignAll(productList);
    } else {
      filteredProductList.assignAll(productList.where((product) => 
        product.name!.toLowerCase().contains(query.toLowerCase()) ||
        product.original!.toLowerCase().contains(query.toLowerCase())));
    }
  }
}
