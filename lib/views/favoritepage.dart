import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sharedprefcontrioller.dart';

class FetchTemperaturesScreen extends StatelessWidget {
  final TemperaturesController temperaturesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Temperatures'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  temperaturesController.fetchTemperatures();
                },
                child: Text('Fetch Temperatures'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () {
                    if (temperaturesController.temperatureList.isEmpty) {
                      return Center(child: Text('No Temperatures'));
                    } else {
                      return ListView.builder(
                        itemCount: temperaturesController.temperatureList.length,
                        itemBuilder: (context, index) {
                          final temperature = temperaturesController.temperatureList[index];
                          return ListTile(
                            title: Text(temperature.name ?? ''),
                            subtitle: Text(temperature.name ?? ''),
                            // Add any other fields you want to display
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
