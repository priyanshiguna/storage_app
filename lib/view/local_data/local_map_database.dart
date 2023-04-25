import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataBaseMap extends StatefulWidget {
  const LocalDataBaseMap({Key? key}) : super(key: key);

  @override
  State<LocalDataBaseMap> createState() => _LocalDataBaseMapState();
}

class _LocalDataBaseMapState extends State<LocalDataBaseMap> {
  SharedPreferences? prefs;
  String? stringData = "";
  Map<String, dynamic> datatypeBytes = {
    "int": 4,
    "string": 8,
    "double": 8,
    "Booleans": 2,
  };

  setInstant() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    setInstant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? encodedMap = json.encode(datatypeBytes);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Data Base"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                prefs!.setString("Map", "List of DataType Bytes");
                prefs!.setString("DataTypeBytes", encodedMap);
              },
              child: const Text("Set Data"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                stringData = prefs!.getString("Map");
                prefs!.setString("DataTypeBytes", encodedMap);
              },
              child: const Text("Get Data"),
            ),
            const SizedBox(height: 15),
            Text(
              stringData!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              encodedMap.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
