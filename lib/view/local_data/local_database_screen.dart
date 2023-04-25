import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataBase extends StatefulWidget {
  const LocalDataBase({Key? key}) : super(key: key);

  @override
  State<LocalDataBase> createState() => _LocalDataBaseState();
}

class _LocalDataBaseState extends State<LocalDataBase> {
  SharedPreferences? prefs;
  String? stringData = "";
  int? intData = 0;
  bool? boolData = false;
  double? doubleData = 0.0;
  List<String>? listData = [];

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
                prefs!.setString("name", "Gopi Guna");
                prefs!.setBool("isCorrect", true);
                prefs!.setDouble("ratio", 0.1);
                prefs!.setInt("number", 5058);
                prefs!.setStringList("qualification",
                    ["SSC", "HSC", "B.COM", "Flutter-Development"]);
              },
              child: const Text("Set Data"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                stringData = prefs!.getString("name");
                intData = prefs!.getInt("number");
                boolData = prefs!.getBool("isCorrect");
                doubleData = prefs!.getDouble("ratio");
                listData = prefs!.getStringList("qualification");
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
              intData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              boolData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              doubleData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              listData!.toString(),
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
// stringData = prefs!.getString("name");
// intData = prefs!.getInt("number");

// if (prefs!.containsKey("first_name")) {
//   debugPrint("Data");
//
//   setState(() {});
// } else {
//   debugPrint("No Data found");
// }
