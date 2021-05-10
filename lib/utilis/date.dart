import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDate extends StatefulWidget {
  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyDate> {
  Timer _timer;
  String _dateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getDate());
  }

  @override
  void dispose() {
    _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void _getDate() {
    setState(() {
      _dateTime = DateFormat().add_MMMMEEEEd().format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_dateTime',
    );
  }
}
