import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/data_service_viewmodel.dart';
import 'package:weather/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataServiceViewModel>(
      create: (context) => DataServiceViewModel(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather',
          home: LoadingScreen()),
    );
  }
}
