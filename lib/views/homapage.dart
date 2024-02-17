import 'package:api_calling_getx/controllers/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sharedprefcontrioller.dart';
import 'favoritepage.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final HomeController productController = Get.put(HomeController());
  final TemperaturesController itemController = Get.put(TemperaturesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Spoonacular"),
        actions: [
          IconButton(
            icon:const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FetchTemperaturesScreen(),));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(
          () {
            if (productController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  var product = productController.productList[index];
                  final indexinlist = itemController.temperatureList.indexWhere((t) => t.id == productController.productList[index].id);
                  if (indexinlist != -1) {
                    product.isFavorite.value = true;
                  //   await _prefsService.removeTemperature(index);
                  //   temperatureList.removeAt(index);
                  }
                  return GestureDetector(
                    onTap: () {
                      // Handle product tap
                    },
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Stack(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.image!,
                    fit: BoxFit.cover,
                  ),
                ),
               
                  Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon:
                           product.isFavorite.value 
                              ?const Icon(Icons.favorite_rounded)
                              :const Icon(Icons.favorite_border),
                          onPressed: () {
                            product.isFavorite.toggle();
                            product.isFavorite.value
                            ?itemController.saveTemperature(product)
                            :itemController.removeTemperature(product);

                          },
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(height: 8),
                            Text(
                              product.name ?? "",
                              maxLines: 1,
                              style:const TextStyle(
                                fontFamily: 'avenir',
                                fontWeight: FontWeight.w800,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.original ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:const TextStyle(
                                fontSize: 16,
                                fontFamily: 'avenir',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

