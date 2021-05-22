import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class CoronaStatus extends StatefulWidget {
  const CoronaStatus({Key key}) : super(key: key);
  @override
  _CoronaStatusState createState() => _CoronaStatusState();
}

class _CoronaStatusState extends State<CoronaStatus> {
  Future<List<Result>> _getResults() async {
    var data = await http.get("http://api-covid-insight.herokuapp.com/state_json");
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Result{
    final String f_state;
    final int _active;
    final int _zone;

  results(this._state, this._active, this._zone);
}