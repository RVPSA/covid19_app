import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: myHomePage(),
    );
  }
}
class myHomePage extends StatelessWidget {
  const myHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid - 19 News'),
        leading: IconButton(
          icon: Icon(Icons.campaign),
          onPressed: (){},
        ),
      ),
      body: Center(
        child: Column(
          children: [
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
                    child: Text("Date: -")
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
                    child: Text("Today Positive Cases: -")
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
                    child: Text("Today Death Cases: -")
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
                    child: Text("Total Death cases: -")
                ),
                elevation: 10,
              ),
            ),
            Text('Covid-19 News update'),
          ],
        ),
      ),
    );
  }
}
