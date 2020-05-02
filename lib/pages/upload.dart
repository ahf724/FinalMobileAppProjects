import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'uploadClass.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  String state, positive, userInput;

  final _formKey = GlobalKey<FormState>();
  Map worldData;
  int i = 0;
  Autogenerated autogenerated;

  fetchFloridaData() async {
    http.Response response = await http
        .get('https://covidtracking.com/api/v1/states/FL/current.json');
    setState(() {
      worldData = json.decode(response.body);
      Autogenerated autogenerated = new Autogenerated.fromJson(worldData);
      state = autogenerated.state.toString();
      positive = autogenerated.positive.toString();
      print(state);
      print(positive);
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
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter a State',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    String userInput = value.toString();
                    return userInput = userInput.toUpperCase();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // Process data.

                      }
                    },
                    child: Text('Submit'),
                  ),
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
                    'Confitmed cases: $positive for $state ',
                    style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}