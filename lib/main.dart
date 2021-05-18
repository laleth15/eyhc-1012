import 'package:flutter/material.dart';
import 'form.dart';
import 'package:url_launcher/url_launcher.dart'; // call with dial pad
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerEdgeDragWidth: 150,
        endDrawerEnableOpenDragGesture: true,
        appBar: AppBar(title: Text("CovidInsight"),centerTitle: true),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width:1.0,color: Colors.amber),
                    ),
                    ),
                child: Center(child: Text("Menu bar",style: TextStyle(fontSize: 25.0),)),
              ),
              ListTile(
                title: Text('Get Help'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Volunteer'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Corona Status'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
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
          alignment: Alignment(1,0.9),
          child: SizedBox(
            width: 75,
            height: 75,
            child: FloatingActionButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomForm()),
                );
              },
              child: Icon(Icons.add_comment_outlined,size: 40,),
              foregroundColor: Colors.amber,
              elevation: 20.0,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0.8,10.0,0.8, 0.8),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8,0,8,10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.announcement_rounded,color: Colors.amber,size: 35.0,),
                    title: Text('Laleth'),
                    subtitle: Text('Ondiputhur,Coimbatore, No:9876543211'),
                  ),
                Text("Description of the problem in 6 lines In this blog, we will look at one of the most basic features of mobile phones – making phone calls. We will make use of flutter plugins to make a phone call programmatically in our app, and will explore two different scenarios of making a direct phone call or getting the intermediate dialler before the call goes through.")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
