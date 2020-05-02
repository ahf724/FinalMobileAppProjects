import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttershare/pages/worldwidepannel.dart';
import 'package:http/http.dart' as http;
class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  Map worldData;
  fetchWorldWideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

@override
void initState() { 
  fetchWorldWideData();
  super.initState();
  
}

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Covid-19 Tracker',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.orange[100],
            child: Text(
              'Nothing is to fear, Covid-19 Tracker is here!',
              style: TextStyle(
                color: Colors.orange[800],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text('Worldwide Statistics', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          ),
          worldData==null?CircularProgressIndicator():WorldwidePannel(worldData: worldData,)
        ],
      ),
    );
  }
}
