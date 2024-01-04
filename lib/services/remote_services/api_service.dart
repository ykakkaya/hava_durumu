import 'package:dio/dio.dart';
import 'package:hava_durumu/models/weather_model.dart';
import 'package:hava_durumu/services/geo_services/geo_services.dart';

class ApiService {
  Future<List<ResultModel>?> getWeather() async {
    var dio = Dio();
    var geoController = GeoServices();
    final location = await geoController.getLocation();

    final String url = "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$location";
    Map<String, dynamic> headers = {
      "authorization": "apikey 3sje3G5XBgHPjY0H1YDZV2:4RDyZQql85TrGUGUFK5mVK",
      "content-type": "application/json"
    };
    var response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode == 200) {
      List list = response.data["result"];
      List<ResultModel> weatherList = list.map((e) => ResultModel.fromJson(e)).toList();

      return weatherList;
    }
    return [];
  }
}
