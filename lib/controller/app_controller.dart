import 'package:get/get.dart';
import 'package:hava_durumu/models/weather_model.dart';
import 'package:hava_durumu/services/remote_services/api_service.dart';

class APPController extends GetxController {
  var service = ApiService();
  List<ResultModel> weatherlist = <ResultModel>[].obs;

  @override
  Future<void> onInit() async {
    await getWeatherList();
    super.onInit();
  }

  Future<void> getWeatherList() async {
    List<ResultModel> liste = <ResultModel>[];
    liste = await service.getWeather();
    weatherlist.assignAll(liste);
  }
}
