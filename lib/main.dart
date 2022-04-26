

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

//splashScreen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds:4),()=>
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>myHomePage())),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //child: Image.network("https://www.godan.info/sites/default/files/styles/partner_results_page_logo/public/news-media/Covid%2019%20%282%29.PNG?itok=uHYXSzsN"),
      child: Image.asset("image/splashscreen.png"),
    );
  }
}





//homepage
class myHomePage extends StatefulWidget {
  const myHomePage({Key? key}) : super(key: key);

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {


  //api
  var date,newCases,todayDeathCases,totaldeath;
  _loadAPIData() async{
    var response = await http.get(Uri.https('www.hpb.health.gov.lk', '/api/get-current-statistical'));

    setState(() {
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        date = jsonResponse['data']['update_date_time'];
        newCases = jsonResponse['data']['local_new_cases'];
        todayDeathCases = jsonResponse['data']['local_new_deaths'];
        totaldeath = jsonResponse['data']['local_deaths'];

      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    });
  }
  //end of API get

  @override
  void initState(){
    super.initState();
    _loadAPIData();
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
                    padding: EdgeInsets.only(left: 20.0,top: 20.0),
                    child:Column(
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
                    padding: EdgeInsets.only(left: 20.0,top: 20.0),
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
                    padding: EdgeInsets.only(left: 20.0,top: 20.0),
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
                    padding: EdgeInsets.only(left: 20.0,top: 20.0),
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
            Text('R.V.P.S.Akesh',style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }
}

