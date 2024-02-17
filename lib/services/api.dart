import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API{
  Dio _dio = Dio();

   API(){
    _dio.options.baseUrl = "https://api.spoonacular.com/recipes/716429/information?apiKey=21e5e6308b614a2ca06eb9ab6811620c&includeNutrition=true.#";
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}