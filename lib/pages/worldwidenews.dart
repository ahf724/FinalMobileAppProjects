import 'package:flutter/material.dart';
//This returns a container of column widgets that display the total results of cases and active cases

class WorldnewsPannel extends StatelessWidget {
final  worldData;
final articles;

  const WorldnewsPannel({Key key, this.worldData, this.articles}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      children: <Widget>[
        StatusPanel(
          title: 'CONFIRMED',
          panelColor: Colors.red[100],
          textColor: Colors.red,
          count: worldData['totalResults'].toString(),
        ),
        StatusPanel(
          title: 'ACTIVE',
          panelColor: Colors.blue[100],
          textColor: Colors.blue[900],
          count: worldData['totalResults'].toString(),
        ),
      ],
    ));
  }
}

class StatusPanel extends StatelessWidget {

final Color panelColor;
final Color textColor;
final String title;
final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);




  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor,),
          ),
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
        ],
      ),
    );
  }
}
