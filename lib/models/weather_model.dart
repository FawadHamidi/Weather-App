/*

{
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 16093,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "sys": {
    "country": "US",
  },
  "name": "Mountain View",
  }
 */

class WeatherModel {
  final String cityName;
  final TemperatureInfo tempInfo;
  final TemperatureInfo humidityInfo;
  final Country countryInfo;
  final WeatherInfo mainInfo;
  final WeatherInfo descInfo;
  final WeatherInfo iconInfo;
  final LonLatInfo lonInfo;
  final LonLatInfo latInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${iconInfo.icon}@2x.png';
  }

  WeatherModel(
      {this.cityName,
      this.tempInfo,
      this.humidityInfo,
      this.countryInfo,
      this.mainInfo,
      this.iconInfo,
      this.descInfo,
      this.lonInfo,
      this.latInfo});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    //cityName
    final cityName = json['name'];
    //temp and humidity
    final tempMain = json['main'];
    final humidityMain = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempMain);
    final humidityInfo = TemperatureInfo.fromJson(humidityMain);
    //country
    final sys = json['sys'];
    final countryInfo = Country.fromJson(sys);
    // main , description and icon
    final weatherMain = json['weather'][0];
    final mainInfo = WeatherInfo.fromJson(weatherMain);
    final weatherDesc = json['weather'][0];
    final descInfo = WeatherInfo.fromJson(weatherDesc);
    final weatherIcon = json['weather'][0];
    final iconInfo = WeatherInfo.fromJson(weatherIcon);
    //lon and lat
    final loncoord = json['coord'];
    final latcoord = json['coord'];
    final lonInfo = LonLatInfo.fromJson(loncoord);
    final latInfo = LonLatInfo.fromJson(latcoord);

    return WeatherModel(
        cityName: cityName,
        tempInfo: tempInfo,
        humidityInfo: humidityInfo,
        countryInfo: countryInfo,
        mainInfo: mainInfo,
        descInfo: descInfo,
        iconInfo: iconInfo,
        lonInfo: lonInfo,
        latInfo: latInfo);
  }
}

//Temperature
class TemperatureInfo {
  var temp;
  final int humidity;

  TemperatureInfo({this.temp, this.humidity});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final humidity = json['humidity'];
    return TemperatureInfo(temp: temp, humidity: humidity);
  }
}

//Country
class Country {
  final String country;

  Country({this.country});

  factory Country.fromJson(Map<String, dynamic> json) {
    final country = json['country'];
    return Country(country: country);
  }
}

// main , description and icon
class WeatherInfo {
  final String main;
  final String desc;
  final String icon;

  WeatherInfo({this.main, this.desc, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final main = json['main'];
    final desc = json['description'];
    final icon = json['icon'];
    return WeatherInfo(main: main, desc: desc, icon: icon);
  }
}

//long and lat
class LonLatInfo {
  var lon;
  var lat;

  LonLatInfo({
    this.lon,
    this.lat,
  });

  factory LonLatInfo.fromJson(Map<String, dynamic> json) {
    final lon = json['lon'];
    final lat = json['lat'];
    return LonLatInfo(lon: lon, lat: lat);
  }
}
