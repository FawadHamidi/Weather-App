import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/data_service_viewmodel.dart';
import 'package:weather/screens/weather_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataServiceViewModel>(context, listen: false);
    provider.loadData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('get Location'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeatherPage()));
          },
        ),
      ),
    );
  }
}
