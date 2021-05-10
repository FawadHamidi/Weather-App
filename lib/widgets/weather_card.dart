import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/data_service_viewmodel.dart';
import 'package:weather/screens/search_screen.dart';

class WeatherCard extends StatefulWidget {
  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataServiceViewModel>(
      builder: (context, provider, child) {
        return provider.weatherModel == null
            ? CircularProgressIndicator()
            : Container(
                padding: EdgeInsets.symmetric(vertical: 24),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            '${provider.weatherModel.cityName}, ${provider.weatherModel.countryInfo.country}'),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchPage()));
                            },
                            child: Icon(Icons.more_horiz_rounded)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${provider.weatherModel.tempInfo.temp.toStringAsFixed(0)}°C',
                              style: TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.w500),
                            ),
                            Text(provider.weatherModel.mainInfo.main),
                            SizedBox(
                              height: 5,
                            ),
                            Text(provider.weatherModel.mainInfo.desc),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                'Humidity ${provider.weatherModel.humidityInfo.humidity}%'),
                          ],
                        ),
                        Container(
                          child: Image.network(provider.weatherModel.iconUrl),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ));
      },
    );
  }
}
