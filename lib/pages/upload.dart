import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  

  
  Map fl, ny,nj, ma, il, ca, mi ;
  int i = 0;

  fetchFloridaData() async {
    http.Response flResponse = await http.get('https://covidtracking.com/api/v1/states/FL/current.json');

    http.Response nyResponse = await http.get('https://covidtracking.com/api/v1/states/NY/current.json');

    http.Response njResponse = await http.get('https://covidtracking.com/api/v1/states/NJ/current.json');

    http.Response maResponse = await http.get('https://covidtracking.com/api/v1/states/MA/current.json');

    http.Response ilResponse = await http.get('https://covidtracking.com/api/v1/states/IL/current.json');
    setState(() {
      fl = json.decode(flResponse.body);

      ny = json.decode(nyResponse.body);

      nj = json.decode(njResponse.body);

      ma = json.decode(maResponse.body);

      il = json.decode(ilResponse.body);
    });
  }

  @override
  void initState() {
    fetchFloridaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Covid-19 Tracker',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
          ),
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.purple[900],
            child: Text(
              fl['state'].toString() + '  CASES:  ' + fl['positive'].toString(),
              style: TextStyle(
                color: Colors.orange[800],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
          ),

          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.purple[900],
            child: Text(
              ny['state'].toString() + '  CASES:  ' + ny['positive'].toString(),
              style: TextStyle(
                color: Colors.orange[800],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
          ),

          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.purple[900],
            child: Text(
              nj['state'].toString() + '  CASES:  ' + nj['positive'].toString(),
              style: TextStyle(
                color: Colors.orange[800],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
          ),

          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.purple[900],
            child: Text(
              ma['state'].toString() + '  CASES:  ' + ma['positive'].toString(),
              style: TextStyle(
                color: Colors.orange[800],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
          ),

          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.purple[900],
            child: Text(
              il['state'].toString() + '  CASES:  ' + il['positive'].toString(),
              style: TextStyle(
                color: Colors.orange[800],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
          ),

        ],
      ),
    );
  }
}
