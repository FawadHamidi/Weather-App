import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/utilis/date.dart';
import 'package:weather/utilis/timer.dart';
import 'package:weather/widgets/bottom_appbar.dart';
import 'package:weather/widgets/forecast_card.dart';
import 'package:weather/widgets/weather_card.dart';

import '../data_service_viewmodel.dart';

class WeatherPage extends StatefulWidget {
  final Color color = Colors.white;
  final WeatherModel weatherModel;

  WeatherPage({this.weatherModel});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataServiceViewModel>(context);
    return Scaffold(
      backgroundColor: provider.color,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              MyTimer(),
              MyDate(),
              SizedBox(
                height: 10,
              ),
              ForecastCard(),
              WeatherCard(),
              SizedBox(
                height: 10,
              ),
              MyBottomAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}
