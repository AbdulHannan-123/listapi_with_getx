import 'package:api_calling_getx/controllers/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

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
        title: Text("Spoonacular"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
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
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  var product = productController.productList[index];
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
                              ? Icon(Icons.favorite_rounded)
                              : 
                              Icon(Icons.favorite_border),
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
            SizedBox(height: 8),
                            Text(
                              product.name ?? "",
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: 'avenir',
                                fontWeight: FontWeight.w800,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8),
                            Text(
                              product.original ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
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

