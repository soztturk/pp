import 'dart:convert';

import 'package:f_application/main.dart';
import 'package:flutter/material.dart';
import 'model/MobilSettingApiTwo.dart';
import 'model/mobilSetTwo.dart';

class JsonExampTwo extends StatefulWidget {
  @override
  _JsonExampStateTwo createState() => _JsonExampStateTwo();
}

class _JsonExampStateTwo extends State<JsonExampTwo> {
  List<MobilSettingsTwo> listMobilTwo =
      new List<MobilSettingsTwo>.empty(growable: true);
  late Iterable list;
  @override
  void initState() {
    super.initState();
    setState(() {
      buildData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Json Deneme 2"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyApp()));
              });
            },
          )),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: ListView.builder(
          itemCount: this.listMobilTwo.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listMobilTwo[index].title),
            );
          },
        ),
      ),
    );
  }

  void buildData() {
    List<MobilSettingsTwo> listMobilTwo =
        new List<MobilSettingsTwo>.empty(growable: true);
    MobilSettingsApiTwo.getMobilSettingsApiTwo().then((response) {
      Iterable list = json.decode(response.data);
      listMobilTwo =
          list.map((value) => MobilSettingsTwo.fromJson(value)).toList();
      for (var item in listMobilTwo) {
        setState(() {
          this.listMobilTwo.add(item);
        });
      }
    });
  }
}
