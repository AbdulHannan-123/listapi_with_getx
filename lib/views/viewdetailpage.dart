import 'package:api_calling_getx/views/favoritepage.dart';
import 'package:flutter/material.dart';

import '../models/postmodel.dart';

class ViewDetailPage extends StatelessWidget {
  final Temperatures temperature;
  final bool isFavorite;

  const ViewDetailPage({Key? key, required this.temperature, required this.isFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
        actions: [
          IconButton(
            icon: isFavorite 
            ? const Icon(Icons.favorite_rounded)
            : const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FetchTemperaturesScreen(),));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
              'Name:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              temperature.name ?? "",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'ID:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              temperature.id?.toString() ?? "",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Consistency:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              temperature.consistency ?? "",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Original:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              temperature.original ?? "",
              style:const  TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Image:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Display image if available, else display placeholder
            Container(
              height: 100,
              width: double.infinity,
              child: temperature.image != null
                ? Image.network(temperature.image!,fit: BoxFit.fill,)
                : const Placeholder(fallbackHeight: 200, fallbackWidth: 200),
            )
          ],
        ),
      ),
    );
  }
}
