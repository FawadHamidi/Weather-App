import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/api_services.dart';

import 'models/four_days_forecast.dart';

class DataServiceViewModel extends ChangeNotifier {
  WeatherModel weatherModel;
  List<WeatherForecastInfo> weatherForecastInfo;
  List<Location> locations;
  Color color = Colors.white;

  void loadData() async {
    List<double> coordinates = await getLocation();
    String city = await getCity(coordinates[0], coordinates[1]);
    weatherModel = await DataServices().getWeather(city);
    notifyListeners();
  }

  void loadSearch(String city) async {
    weatherModel = await DataServices().getWeather(city);
    notifyListeners();
  }

  Future<List<double>> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = double.parse(position.latitude.toStringAsFixed(2));
    double longitude = double.parse(position.longitude.toStringAsFixed(2));
    return [latitude, longitude];
  }

  Future<String> getCity(double lat, double long) async {
    final coordinates = Coordinates(lat, long);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first.locality;
  }

  //
  void loadForecastData({String city}) async {
    locations = await getLocationCoordinates(city);
    weatherForecastInfo = await DataServices()
        .getForecastWeather(locations[0]?.latitude, locations[0]?.longitude);
    notifyListeners();
  }

  getLocationCoordinates(String city) async {
    return await locationFromAddress(city);
  }

  changeColor() {
    if (color == Colors.white) {
      color = Colors.lightBlueAccent.shade100;
    } else if (color == Colors.lightBlueAccent.shade100) {
      color = Colors.amber.shade100;
    } else if (color == Colors.amber.shade100) {
      color = Colors.white;
    }
  }

  notifyListeners();
}
