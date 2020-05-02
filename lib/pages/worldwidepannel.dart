import 'package:flutter/material.dart';
// This returns all the widgets to the stats.dart to see the stats
class WorldwidePannel extends StatelessWidget {
final Map worldData;

  const WorldwidePannel({Key key, this.worldData}) : super(key: key);

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
          count: worldData['cases'].toString(),
        ),
        StatusPanel(
          title: 'ACTIVE',
          panelColor: Colors.blue[100],
          textColor: Colors.blue[900],
          count: worldData['active'].toString(),
        ),
        StatusPanel(
          title: 'RECOVERED',
          panelColor: Colors.green[100],
          textColor: Colors.green,
          count: worldData['recovered'].toString(),
        ),
        StatusPanel(
          title: 'Today Cases',
          panelColor: Colors.green,
          textColor: Colors.grey[900],
          count: worldData['todayCases'].toString(),
        ),
        StatusPanel(
          title: 'DEATHS',
          panelColor: Colors.black,
          textColor: Colors.white,
          count: worldData['deaths'].toString(),
        ),
        StatusPanel(
          title: 'DEATHS TODAY',
          panelColor: Colors.black,
          textColor: Colors.white,
          count: worldData['todayDeaths'].toString(),
        ),
        StatusPanel(
          title: 'CRITICAL',
          panelColor: Colors.pink[400],
          textColor: Colors.pink[900],
          count: worldData['critical'].toString(),
        ),
        StatusPanel(
          title: 'TESTS',
          panelColor: Colors.teal[400],
          textColor: Colors.teal[900],
          count: worldData['tests'].toString(),
        ),
        StatusPanel(
          title: 'Affected Countries',
          panelColor: Colors.yellow[400],
          textColor: Colors.yellow[900],
          count: worldData['affectedCountries'].toString(),
        ),
        StatusPanel(
          title: 'DEATH PER 1 MILLION',
          panelColor: Colors.black,
          textColor: Colors.white,
          count: worldData['deathsPerOneMillion'].toString(),
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
