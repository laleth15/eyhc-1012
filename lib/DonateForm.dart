import 'package:covid_project/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonateForm extends StatefulWidget {
  const DonateForm({Key key}) : super(key: key);

  @override
  _DonateFormState createState() => _DonateFormState();
}

class _DonateFormState extends State<DonateForm> {
  String _orgName,
      _orgtype,
      _name,
      _email,
      _number,
      _address,
      _pincode,
      _quantity,
      _comments,
      _item,
      _deliveryMethod,
      _country,
      _state,
      _district;
  final _formKey = GlobalKey<FormState>();
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
                  Navigator.pushReplacementNamed(
                    context,
                    "/GetHelp",
                  );
                },
              ),
              ListTile(
                title: Text('Donate Resources'),
                onTap: () {
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
        appBar: AppBar(title: Text("CovidInsight"), centerTitle: true),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Organizations and individuals are encouraged to come forward and donate Medical Equipment.",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter organization name';
                      } else {
                        _orgName = value;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Organization Name',
                        labelText: 'Organization Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber, width: 1),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black38,
                        )),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _orgName = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5))),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_downward_sharp),
                      iconSize: 20,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                      focusColor: Colors.amber,
                      value: _orgtype,
                      validator: (value) => value == null
                          ? 'Please fill in Organization Type'
                          : null,
                      isExpanded: true,
                      items: <String>["Public", "Private", "NGO", "Others"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        "Organization Type",
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _orgtype = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        _name = value;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Name',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _name = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Contact Details of the Representative",
                        style: TextStyle(fontSize: 15),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter email ID';
                      } else {
                        _email = value;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email ID',
                      labelText: 'Email ID',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _email = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your Mobile Number';
                      } else {
                        _number = value;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Mobile Number',
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _number = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your address';
                      } else {
                        _address = value;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Address',
                      labelText: 'Address',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _address = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5))),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_downward_sharp),
                      iconSize: 20,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                      focusColor: Colors.amber,
                      value: _item,
                      validator: (value) =>
                          value == null ? 'Please fill in Item' : null,
                      isExpanded: true,
                      items: <String>[
                        "Volunteer",
                        "Food",
                        "Donate Money",
                        "Oxygen cylinders with 10 liters",
                        "Oxygen cylinders with 45 liters capacity",
                        "Oxygen concentrators 5 LPM",
                        "Oxygen concentrators 10 LPM",
                        "Remdesivir",
                        "Tocilizumab",
                        "Doxycycline",
                        "Ivermectin",
                        "Ventilators/ BIPAP",
                        "Oxygen Cylinder 5 kg",
                        "Oxygen Cylinder 10 kg",
                        "Portable Oxygen Can 8 Ltr",
                        "Portable Oxygen Can 10 Ltr",
                        "Portable Oxygen Can 12 Ltr",
                        "Oximeters",
                        "Fabiflu or Favipiravir",
                        "Electronic Thermometer",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        "Item to be donated",
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _item = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a quantity';
                      } else {
                        _quantity = value;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Quantity to be donated',
                      labelText: 'Quantity to be donated',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _quantity = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Delivery Details",
                        style: TextStyle(fontSize: 15),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5))),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_downward_sharp),
                      iconSize: 20,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                      focusColor: Colors.amber,
                      value: _deliveryMethod,
                      validator: (value) => value == null
                          ? 'Please fill in delivery method'
                          : null,
                      isExpanded: true,
                      items: <String>[
                        "Pick up",
                        "Shipping",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        "Delivery Method",
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _deliveryMethod = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a country';
                      } else {
                        _country = value;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Country',
                      labelText: 'Country',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _country = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a state/UT';
                      } else {
                        _state = value;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'State/UT',
                      labelText: 'State/UT',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _state = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a district';
                      } else {
                        _district = value;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'District',
                      labelText: 'District',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _district = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      _comments = value;
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Comments/Requests',
                      labelText: 'Comments/Requests',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    cursorColor: Colors.amber,
                    cursorHeight: 25,
                    onSaved: (value) => _comments = value,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          )),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: const Text('Form Submitted'),
                                action: SnackBarAction(
                                  textColor: Colors.amber,
                                  label: "Ok",
                                  onPressed: () {
                                    Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomePage(),
                                      ),
                                    );
                                  },
                                )),
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.amber, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
