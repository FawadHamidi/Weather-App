import 'dart:async';

import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {
  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  Timer _timer;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void _getTime() {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('${_dateTime.hour}:${_dateTime.minute}',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50));
  }
}
