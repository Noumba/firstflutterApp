import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidTracker extends StatefulWidget {
  @override
  _CovidTrackerState createState() => _CovidTrackerState();
}

class _CovidTrackerState extends State<CovidTracker> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response =
        await http.get('https://disease.sh/v3/covid-19/all');
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://disease.sh/v3/covid-19/countries');
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Tracker'),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.orangeAccent,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: Text(
                DataSearch.text,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Worldwide',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.0)),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Regional',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldWidePanel(worldData: worldData),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Most affected Countries',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            countryData == null
                ? Container()
                : MostAffectedCountries(
                    countryData: countryData,
                  ),
            InfoPanel(),
          ],
        ),
      ),
    );
  }
}

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2.0),
        children: [
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
            title: 'DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      color: panelColor,
      height: 80,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            count,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class MostAffectedCountries extends StatelessWidget {
  final List countryData;

  const MostAffectedCountries({Key key, this.countryData}) : super(key: key);

  int sortByDeaths(b, a) {
    if (b["deaths"] > a["deaths"])
      return -1;
    else if (b["deaths"] < a["deaths"]) return 1;
    else return 0;
  }

  @override
  Widget build(BuildContext context) {
    // countryData.sort(
    //     (b, a) => b["deaths"].toString().compareTo(a["deaths"].toString()));
    countryData.sort(sortByDeaths);
    List newData = countryData.sublist(0,4);
    //List newData = countryData.getRange(0, 4);
    return Container(
      child: ListView.builder(
          itemCount: newData.isEmpty ? 0 : newData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Row(
                children: <Widget>[
                  Image.network(
                    newData[index]["countryInfo"]["flag"],
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Container(
                      width: 50.0,
                      child: Text(
                        newData[index]["country"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    'Deaths: ' + newData[index]["deaths"].toString(),
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'FAQS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'DONATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'MYTH BUSTERS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}

class DataSearch {
  static String text =
      'Nothing in this life is to be forced, it is only to be understood. Now is the time to understand more, so that we may fear less';

  static List questionAnswers = [
    {
      "question": "What is COVID-19?",
      "answer":
          "COVID-19 is caused by SARS-CoV2, a new strain of coronavirus that has not previously been identified in humans. It was first identified in Wuhan, Hubei Province, China, where it caused a large and ongoing outbreak. It has been declared a global pandemic. The COVID-19 virus is closely related to a bat coronavirus"
    },
    {
      "question": "What are the variants of concern? How are they detected?",
      "answer":
          "The SARS-CoV-2 virus that causes COVID-19, like other viruses, is continually undergoing changes in in its genetic structure (its genome). Think of the genome as a blueprint that shows a cell how to create more of the virus. Every time someone is infected with a virus there is an opportunity for the virus to change a little. Most of the time, these changes don't make the virus more dangerous, though they can help us to work out where particular cases of the virus originated. However, sometimes the virus can change in ways that make it easier for the virus to spread, or to make people sicker, or both. When this happens, we use the name variants of concern."
    },
    {
      "question": "How is COVID-19 spread?",
      "answer":
          "The virus can spread from an infected person's mouth or nose in small liquid particles when they cough, sneeze, speak, sing or breathe heavily. These liquid particles are different sizes, ranging from larger 'respiratory droplets' to smaller 'aerosols'."
    },
    {
      "question": "How long does it last on surfaces?",
      "answer":
          "Early research suggests that the length of time that COVID-19 can survive on surfaces may vary under different conditions (e.g. type of surface, temperature or humidity of the environment). Studies suggest that coronaviruses (including preliminary information on the COVID-19 virus) may persist on surfaces for a few hours or up to several days."
    },
    {
      "question": "Can it be spread in swimming pools and baths?",
      "answer":
          "The risk of contracting COVID-19 through swimming in ocean pools and baths is considered low. The COVID-19 virus is unlikely to survive for long periods in salt water"
    },
    {
      "question": "What are the symptoms of COVID-19?",
      "answer":
          "Symptoms of COVID-19 include: \nfever (37.5 ° or higher) \ncoughsore \nthroatshortness of breath (difficulty breathing)\nrunny nose\nloss of taste\nloss of smell."
    }
  ];
}
