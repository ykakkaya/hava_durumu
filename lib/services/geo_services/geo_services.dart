import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeoServices {
  Future<String> getLocation() async {
    bool serviceEnable;
    Future<LocationPermission> permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("Lütfen konum servislerine izin veriniz");
    }
    permission = Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Konum servislerine izin veriniz");
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemark[0].administrativeArea ?? "ankara";
  }
}
