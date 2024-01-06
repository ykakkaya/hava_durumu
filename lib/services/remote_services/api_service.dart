import 'package:dio/dio.dart';
import 'package:hava_durumu/models/weather_model.dart';
import 'package:hava_durumu/services/geo_services/geo_services.dart';
import 'package:hava_durumu/services/remote_services/dio_manager.dart';

class ApiService {
  Future<List<ResultModel>> getWeather() async {
    var dio = DioManager().dio;
    var geoController = GeoServices();
    final location = await geoController.getLocation();

    final String url =
        "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$location";
    Map<String, dynamic> headers = {
      "authorization": "apikey 3sje3G5XBgHPjY0H1YDZV2:4RDyZQql85TrGUGUFK5mVK",
      "content-type": "application/json"
    };
<<<<<<< HEAD
    var response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode == 200) {
      List liste = response.data["result"];
      List<ResultModel> weatherList = liste.map((e) => ResultModel.fromJson(e)).toList();
=======
    final response = await dio.get(url, options: Options(headers: headers));
>>>>>>> 39d535a44b73ed0ca24c2e7f77c226362cbb119e

    if (response.statusCode == 200) {
      List<ResultModel> weatherList = (response.data["result"] as List)
          .map((e) => ResultModel.fromJson(e))
          .toList();
      return weatherList;
    } else {
      print("API request failed with status code: ${response.statusCode}");
      return [];
    }
  }
}
