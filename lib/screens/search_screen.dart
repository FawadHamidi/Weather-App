import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/data_service_viewmodel.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataServiceViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _controller,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                await _search(provider);
                Navigator.pop(
                  context,
                );
              },
              child: Text('Search'))
        ],
      )),
    );
  }

  Future<void> _search(DataServiceViewModel dataServices) async {
    dataServices.loadSearch(_controller.text);
  }
}
