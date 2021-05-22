import 'package:covid_project/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class GridLayout {
  final String title;
  final IconData icon;

  GridLayout({this.title, this.icon});
}

class GetHelp extends StatelessWidget {
  List<GridLayout> _options =[
    GridLayout(title:'Ambulance' ,icon:FontAwesomeIcons.ambulance ),
    GridLayout(title:"Food" ,icon:FontAwesomeIcons.utensils ),
    GridLayout(title:"Beds" ,icon:FontAwesomeIcons.procedures ),
    GridLayout(title:"Helpline" ,icon:Icons.phone ),
    GridLayout(title:"Doctor" ,icon:FontAwesomeIcons.userMd ),
    GridLayout(title:"Home care" ,icon:FontAwesomeIcons.clinicMedical),
    GridLayout(title:"Vaccine" ,icon:FontAwesomeIcons.syringe ),
    GridLayout(title:"Oxygen" ,icon:FontAwesomeIcons.lungs ),
    GridLayout(title:"Labs" ,icon:FontAwesomeIcons.vial ),
    GridLayout(title:"Medicine" ,icon:FontAwesomeIcons.pills ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawerEdgeDragWidth: 150,
      endDrawerEnableOpenDragGesture: true,
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Donate Resources'),
              onTap: () {
                Navigator.pushReplacementNamed(context,"/DonateForm",);
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
      appBar: AppBar(title: Text("CovidInsight"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            itemCount: _options.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.bottomCenter,
                child: Column(children: <Widget>[
                  SizedBox(height: 40.0,),
                  Icon(_options[index].icon,size: 75.0,color: Colors.amber,),
                  SizedBox(height: 15.0,),
                  Text(_options[index].title,style: TextStyle(fontSize: 25.0,color: Colors.white),)]),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
              );
            }),
      ),
    ));
  }
}
