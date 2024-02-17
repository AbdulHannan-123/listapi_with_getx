import 'package:api_calling_getx/models/postmodel.dart';
import 'package:api_calling_getx/services/api.dart';
import 'package:dio/dio.dart';

class RemoteServices {
  static API api = API();

   static Future<List<Temperatures>> fetchProducts() async {
    try {
      Response response = await api.sendRequest.get('/todos');
      List<dynamic> postMaps = response.data['extendedIngredients'];
      return postMaps.map((e) => Temperatures.fromJson(e)).toList();
    } catch (e) {
      throw e;
    }
  }

}