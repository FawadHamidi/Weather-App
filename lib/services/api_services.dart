import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/four_days_forecast.dart';
import 'package:weather/models/weather_model.dart';

class DataServices {
  WeatherModel weatherModel;
  List<WeatherForecastInfo> weatherForecastInfoList;
  Future<WeatherModel> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '39b2b9fc74aaa86ac6640713492261f4',
      'units': 'metric'
    };
    final uri = Uri.https(
        "api.openweathermap.org", "/data/2.5/weather", queryParameters);
    final res = await http.get(uri);
    final json = jsonDecode(res.body);
    return weatherModel = WeatherModel.fromJson(json);
  }

  Future<List<WeatherForecastInfo>> getForecastWeather(
      double lat, double lon) async {
    final parameters = {
      'lat': "$lat",
      'lon': "$lon",
      'exculde': "current,minutely,hourly,alerts",
      'appid': '39b2b9fc74aaa86ac6640713492261f4',
      'units': 'metric'
    };
    final uri = Uri.https(
      "api.openweathermap.org",
      "/data/2.5/onecall",
      parameters,
    );
    final res = await http.get(uri);
    final json = jsonDecode(res.body);
    weatherForecastInfoList = (json['daily'] as List)
        .map((e) => WeatherForecastInfo.fromJson({
              "temp": TempForecast.fromJson(
                  {"min": e['temp']['min'], "max": e['temp']['max']}),
              "weather": (e['weather'] as List)
                  .map((k) => ForecastInfo.fromJson(
                      {'main': k['main'], 'icon': k['icon']}))
                  .toList()
            }))
        .toList();

    return weatherForecastInfoList;
  }
}
