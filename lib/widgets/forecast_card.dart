import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/data_service_viewmodel.dart';

class ForecastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<DataServiceViewModel>(context, listen: false);

    return Consumer<DataServiceViewModel>(builder: (context, provider, child) {
      provider.loadForecastData(city: provider.weatherModel.cityName);
      return provider.weatherForecastInfo == null
          ? CircularProgressIndicator()
          : Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24),
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${DateFormat().add_EEEE().format(DateTime.now().add(Duration(days: 1)))}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Image.network(
                          provider.weatherForecastInfo[0].iconUrl,
                          scale: 2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${provider.weatherForecastInfo[0].tempForecast.tempMin.toStringAsFixed(0)}° | ${provider.weatherForecastInfo[0].tempForecast.tempMax.toStringAsFixed(0)}°',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${provider.weatherForecastInfo[0].forecastInfo[0].main}',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black38)),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${DateFormat().add_EEEE().format(DateTime.now().add(Duration(days: 2)))}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Image.network(
                          provider.weatherForecastInfo[1].iconUrl,
                          scale: 2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${provider.weatherForecastInfo[1].tempForecast.tempMin.toStringAsFixed(0)}° | ${provider.weatherForecastInfo[1].tempForecast.tempMax.toStringAsFixed(0)}°',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${provider.weatherForecastInfo[1].forecastInfo[0].main}',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black38)),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${DateFormat().add_EEEE().format(DateTime.now().add(Duration(days: 3)))}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Image.network(
                          provider.weatherForecastInfo[2].iconUrl,
                          scale: 2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${provider.weatherForecastInfo[2].tempForecast.tempMin.toStringAsFixed(0)}° | ${provider.weatherForecastInfo[2].tempForecast.tempMax.toStringAsFixed(0)}°',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${provider.weatherForecastInfo[2].forecastInfo[0].main}',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black38)),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${DateFormat().add_EEEE().format(DateTime.now().add(Duration(days: 4)))}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Image.network(
                          provider.weatherForecastInfo[3].iconUrl,
                          scale: 2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${provider.weatherForecastInfo[3].tempForecast.tempMin.toStringAsFixed(0)}° | ${provider.weatherForecastInfo[3].tempForecast.tempMax.toStringAsFixed(0)}°',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${provider.weatherForecastInfo[3].forecastInfo[0].main}',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black38)),
                      ],
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
