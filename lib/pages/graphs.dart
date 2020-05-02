import 'package:flutter/material.dart';
 import 'dart:convert';
 import 'package:http/http.dart' as http;

// This page displays the countries stats in a bargraph format


class ActivityFeed extends StatefulWidget {
  ActivityFeed({Key key}) : super(key: key);
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {
  Map usaData, spainData, italyData, franceData, ukData;
  fetchUsaData()async{
    http.Response usa = await http.get('https://disease.sh/v2/countries/usa?yesterday=true');
    http.Response spain = await http.get('https://disease.sh/v2/countries/spain?yesterday=true');
    http.Response italy = await http.get('https://disease.sh/v2/countries/italy?yesterday=true');
    http.Response france = await http.get('https://disease.sh/v2/countries/france?yesterday=true');
     http.Response uk = await http.get('https://disease.sh/v2/countries/uk?yesterday=true');
    setState(() {
      usaData = json.decode(usa.body);
      spainData = json.decode(spain.body);
      italyData = json.decode(italy.body);
      franceData = json.decode(france.body);
      ukData = json.decode(uk.body);
    });
  }

@override
  void initState() {
    fetchUsaData();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            width: 300,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            color: Colors.red[600],
            child: Text(usaData['country'].toString() + '  CASES:  ' + usaData['cases'].toString(),
            style: TextStyle(  
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ), ),
          ),
Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            
          ),
          
          Container(
            height: 100,
            width: 250,
            
            padding: EdgeInsets.all(10),
            color: Colors.red[500],
            child: Text(
              spainData['country'].toString() + '  CASES:  ' + spainData['cases'].toString(),
              style: TextStyle(
                color: Colors.black,
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
            width: 200,
            
            padding: EdgeInsets.all(10),
            color: Colors.red[400],
            child: Text(
              italyData['country'].toString() + '  CASES:  ' + italyData['cases'].toString(),
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            
          ),

          Container(
            height: 90,
            width: 150,
            
            padding: EdgeInsets.all(10),
            color: Colors.yellow[300],
            child: Text(
              ukData['country'].toString() + '  CASES:  ' + ukData['cases'].toString(),
              
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            
          ),

           Container(
            height: 80,
            width: 100,
            
            padding: EdgeInsets.all(10),
            color: Colors.green[100],
            child: Text(
              franceData['country'].toString() + '  CASES:  ' + franceData['cases'].toString(),
              style: TextStyle(
                color: Colors.black,
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

class ActivityFeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
