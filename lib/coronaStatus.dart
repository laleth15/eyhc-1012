import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';


class CoronaStatus extends StatefulWidget {
  const CoronaStatus({Key key}) : super(key: key);

  @override
  _CoronaStatusState createState() => _CoronaStatusState();
}

class _CoronaStatusState extends State<CoronaStatus> {
  final String url =
      "https://api-covid-insight.herokuapp.com/state_json";

  var result;
  Future<String> getData() async {
    var res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    setState(() {
      var resBody = json.decode(res.body);
      result = resBody;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawerEdgeDragWidth: 150,
      endDrawerEnableOpenDragGesture: true,
      appBar: AppBar(title: Text("CovidInsight"), centerTitle: true),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 150.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.amber),
                  ),
                ),
                child: Center(
                    child: Image(
                  image: AssetImage("assets/images/appdrawer.png"),
                )),
              ),
            ),
            ListTile(
              title: Text('Get Help'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/GetHelp",
                );
              },
            ),
            ListTile(
              title: Text('Donate Resources'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/DonateForm",
                );
              },
            ),
            ListTile(
              title: Text('Corona Status'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Resource Availability'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/ResourceData",
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: result["State"] == null ? 0 : result["State"].length,
              itemBuilder: (BuildContext context, int index) {
                index.toString();
                return Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Card(
                          child: Column(
                              children: <Widget>[Container(
                                  padding: EdgeInsets.all(15.0),
                                  child: Row(
                                    children: <Widget>[
                                      AutoSizeText(result["State"][index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                            color: Colors.black87),
                                        maxLines: 2,),
                                    ],
                                  )),
                                Container(
                                    padding: EdgeInsets.all(15.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Active Cases: "),
                                        Text(result["Active"][index].toString(),
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.red)),
                                      ],
                                    )),
                                Container(
                                    padding: EdgeInsets.all(15.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Zone: "),
                                        Text(result["Zone"][index],
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black87)
                                        ),
                                      ],
                                    )),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return LinearProgressIndicator(color: Colors.amber,backgroundColor: Colors.black45,);
        }
      ),
    ));
  }

  //@override
 // void initState() {
 //   super.initState();
   // this.getData();
  //}
}
