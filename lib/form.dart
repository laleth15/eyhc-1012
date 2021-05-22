import 'package:covid_project/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class CustomForm extends StatefulWidget {
  CustomForm({this.app});
  final FirebaseApp app;
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  String _name,_number,_description,_state,_city;
  final referenceDatabase = FirebaseDatabase.instance;
  final _formKey = GlobalKey<FormState>();
  DatabaseReference _detailsRef;

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("CovidInsight"),centerTitle: true),
          body:Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0,30.0,20.0,0.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Ask for help",style: TextStyle(fontSize: 20,color:Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10.0),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
                          filled: true,
                          hintText: 'Your Name',
                          labelText: 'Your Name',
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
                      onSaved: (value) => _name = value,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your contact number';
                        } else {
                          _number = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Contact Number',
                        labelText: 'Contact Number',
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
                      onSaved: (value) => _number = value,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your location';
                        } else {
                          _city = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'City',
                        labelText: 'City',
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
                      onSaved: (value) => _city = value,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your location';
                        } else {
                          _state = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'State',
                        labelText: 'State',
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
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your location';
                        } else {
                          _description = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Describe your problem',
                        labelText: 'Description',
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
                      maxLines: 7,
                      cursorColor: Colors.amber,
                      cursorHeight: 25,
                      onSaved: (value) => _description = value,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),)
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            ref
                            .child("Details")
                            .push()
                            .set({
                              'Name':_name,
                              "Number" : _number,
                              "City" : _city,
                              "State" : _state,
                              "Description" : _description,
                              "CreatedOn": ServerValue.timestamp,
                            })
                            .asStream();
                            Navigator.pop(context,MaterialPageRoute(
                              builder: (_) => HomePage(name: _name,detailsRef: _detailsRef,app: widget.app,
                              ),),);
                          }
                        },
                        child: Center(
                          child: Text(
                            'POST',
                            style: TextStyle(color: Colors.amber,fontSize: 20),
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
