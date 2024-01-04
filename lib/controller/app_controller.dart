import 'package:get/get.dart';
import 'package:hava_durumu/models/weather_model.dart';
import 'package:hava_durumu/services/remote_services/api_service.dart';

class APPcontroller extends GetxController {
  var service = ApiService();
  List list = [].obs;

  @override
  void onInit() {
    getWeatherList();
    super.onInit();
  }

  Future<void> getWeatherList() async {
    var liste = await service.getWeather();
    list.assign(liste);
  }
}
