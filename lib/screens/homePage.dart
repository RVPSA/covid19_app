import 'package:covid19_app/notification/notification_1.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;



//homepage
class myHomePage extends StatefulWidget {
  const myHomePage({Key? key}) : super(key: key);

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {


  //api
  var date, newCases, todayDeathCases, totaldeath, notify= false;
  _loadAPIData() async {
    var response = await http.get(
        Uri.https('www.hpb.health.gov.lk', '/api/get-current-statistical'));

    setState(() {
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<
            String,
            dynamic>;
        date = jsonResponse['data']['update_date_time'];
        newCases = jsonResponse['data']['local_new_cases'];
        todayDeathCases = jsonResponse['data']['local_new_deaths'];
        totaldeath = jsonResponse['data']['local_deaths'];
        notify=true;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    });
  }

  //end of API get

  @override
  void initState() {
    super.initState();
    _loadAPIData();
    Notification_1.init(); //init method of notification_1 class
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid - 19 Daily News'),
        leading: IconButton(
          icon: Icon(Icons.campaign),
          onPressed: _loadAPIData,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                color: Colors.amber[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                    padding: EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Column(
                      children: [
                        Text("Date: -"),
                        Text('${date}'),
                      ],
                    )
                ),
                elevation: 10,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                    padding: EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Column(
                      children: [
                        Text("Today Positive Cases: -"),
                        Text('${newCases}'),
                      ],
                    )
                ),
                elevation: 10,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                color: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                    padding: EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Column(
                      children: [
                        Text("Today Death Cases: -"),
                        Text('${todayDeathCases}'),
                      ],
                    )
                ),
                elevation: 10,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                    padding: EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Column(
                      children: [
                        Text("Total Death cases: -"),
                        Text('${totaldeath}'),
                      ],
                    )
                ),
                elevation: 10,
              ),
            ),
            TextButton(
              onPressed: (){
                Notification_1.showNotification(title: "Covid-19 Update",
                    body:'New cases:- ${newCases}  TotalDeath:- ${totaldeath}',payload: "abc");},
              child: Row(
                children: [
                  Icon(Icons.notifications),
                  Text('Simple Notiication'),
                ],
              ),
            ),
            TextButton(
              onPressed: (){
                Notification_1.sheduleNotification1(title: "Covid-19 Update",
                    body:'New cases:- ${newCases}  TotalDeath:- ${totaldeath}',payload: "abc");},
              child: Row(
                children: [
                  Icon(Icons.notifications),
                  Text('Shedule Notiication'),
                ],
              ),
            ),
            Text('R.V.P.S.Akesh', style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }
}