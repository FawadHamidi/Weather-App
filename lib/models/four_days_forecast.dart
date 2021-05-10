/* "daily": [
{
"temp": {
"min": 275.09,
"max": 284.07,
},
"weather": [
{
"main": "Clouds",
"icon": "10d"
}

} */

//Model
class WeatherForecastInfo {
  int i;
  final TempForecast tempForecast;
  final List<ForecastInfo> forecastInfo;
  // final ForecastInfo iconInfo;
  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${forecastInfo[0].icon}@2x.png';
  }

  WeatherForecastInfo({this.tempForecast, this.forecastInfo});

  factory WeatherForecastInfo.fromJson(Map<String, dynamic> json) {
    final tempForecast = json['temp'];
    final forecastInfo = json['weather'];

    return WeatherForecastInfo(
        tempForecast: tempForecast, forecastInfo: forecastInfo);
  }
}

// Forecast icon model
class ForecastInfo {
  final String icon;
  final String main;

  ForecastInfo({this.icon, this.main});

  factory ForecastInfo.fromJson(Map<String, dynamic> json) {
    final icon = json['icon'];
    final main = json['main'];
    return ForecastInfo(icon: icon, main: main);
  }
}

//Temperature forecast model
class TempForecast {
  var tempMin;
  var tempMax;

  TempForecast({this.tempMin, this.tempMax});

  factory TempForecast.fromJson(Map<String, dynamic> json) {
    final tempMin = json['min'];
    final tempMax = json['max'];
    return TempForecast(tempMax: tempMax, tempMin: tempMin);
  }
}
