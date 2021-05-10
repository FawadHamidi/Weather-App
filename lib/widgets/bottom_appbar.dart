import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/data_service_viewmodel.dart';
import 'package:weather/screens/search_screen.dart';

class MyBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataServiceViewModel>(context, listen: false);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.cloud,
                color: Colors.blue,
              ),
              Text(
                'Weather',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          GestureDetector(
            onTap: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.gps_fixed_rounded),
                  Text('Search'),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              provider.changeColor();
            },
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.color_lens),
                  Text('Color'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
