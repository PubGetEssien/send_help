import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MapScreen());

class MapScreen extends StatelessWidget {
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      // forceAndroidLocationManager: true
    );
    print(position.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Map",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Send Help'),
          backgroundColor: Colors.lightBlue,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_rounded,
                  size: 100,
                  color: Colors.red,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue, // background
                      onPrimary: Colors.white), // foreground
                  onPressed: () {
                    getLocation();
                  },
                  child: Text('Request for help'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
