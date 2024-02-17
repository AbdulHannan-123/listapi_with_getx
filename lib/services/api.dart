import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API{
  Dio _dio = Dio();

   API(){
    _dio.options.baseUrl = "https://api.spoonacular.com/recipes/716429/information?apiKey=c07d7a2726104b51aadc61b98b8d6bf9&includeNutrition=true.#";
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}