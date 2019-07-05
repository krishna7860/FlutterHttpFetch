import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http ;
void main() => runApp(new MaterialApp(
  home: new HomePage(),

));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String Url="https://swapi.co/api/people/";
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve JSON Http Get "),
      ),
      body:new ListView.builder(
          itemCount: data == null ? 0 : data.length ,
          itemBuilder: (BuildContext context, int index){
            return new Container(
             child: new Center(
               child: new Column(
                 crossAxisAlignment:CrossAxisAlignment.stretch,
                 children: <Widget>[
                   new Card(
                     child: new Container(
                       child:new Text(data[index]["name"]),
                       padding: const EdgeInsets.all(20.0),

                     )
                   )
                 ],
               ),
             ), 
            );
          },
      ),

    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(
      Uri.encodeFull(Url),
      // only accept json response'
      headers:{"Accept":"application/json"}
      
    );
    print(response.body);
    setState(() {
      var converDatatoJson= json.decode(response.body);
      data = converDatatoJson["results"];
      return "success";
    });
  }
}
