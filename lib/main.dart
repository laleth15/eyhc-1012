import 'package:covid_project/DonateForm.dart';
import 'package:covid_project/GetHelp.dart';
import 'package:covid_project/coronaStatus.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder> {
          "/GetHelp" : (BuildContext context) => new GetHelp(),
          "/DonateForm" : (BuildContext context) => new DonateForm(),
          "/CoronaStatus":(BuildContext context) => new CoronaStatus(),
        },
      title: "CovidInsight",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final FirebaseApp app;
  final String name;
  DatabaseReference detailsRef;

  HomePage({Key key, this.app, this.detailsRef, this.name}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    widget.detailsRef = database.reference().child("Details");
    super.initState();
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
                  Navigator.popAndPushNamed(context,"/GetHelp",);
                },
              ),
              ListTile(
                title: Text('Donate Resources'),
                onTap: () {
                  Navigator.popAndPushNamed(context,"/DonateForm",);
                },
              ),
              ListTile(
                title: Text('Corona Status'),
                onTap: () {
                  Navigator.popAndPushNamed(context,"/CoronaStatus",);
                },
              ),
              ListTile(
                title: Text('Resource Availability'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment(1, 0.9),
          child: SizedBox(
            width: 75,
            height: 75,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomForm()),
                );
              },
              child: Icon(
                Icons.add_comment_outlined,
                size: 40,
              ),
              foregroundColor: Colors.amber,
              elevation: 20.0,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0.8, 10.0, 0.8, 0.8),
          child: Column(
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.announcement_rounded,
                          color: Colors.amber,
                          size: 35.0,
                        ),
                        title: Text('Laleth'),
                        subtitle: Text('Ondiputhur,Coimbatore, No:9876543211'),
                      ),
                      Text(
                          "Description of the problem in 6 lines In this blog, we will look at one of the most basic features of mobile phones – making phone calls. We will make use of flutter plugins to make a phone call programmatically in our app, and will explore two different scenarios of making a direct phone call or getting the intermediate dialler before the call goes through.")
                    ],
                  ),
                ),
              ),
              Flexible(
                  child: new FirebaseAnimatedList(
                      reverse: true,
                      shrinkWrap: true,
                      query: FirebaseDatabase.instance
                          .reference()
                          .child("Details"),
                      itemBuilder: (BuildContext context, DataSnapshot data,
                          Animation<double> animation, int index) {
                        return new Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.announcement_rounded,
                                    color: Colors.amber,
                                    size: 35.0,
                                  ),
                                  title: new Text(data.value["Name"]),
                                  subtitle: new Text(data.value["City"] +
                                      "," +
                                      data.value["State"] +
                                      "," +
                                      data.value["Number"]),
                                ),
                                Text(data.value["Description"])
                              ],
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
