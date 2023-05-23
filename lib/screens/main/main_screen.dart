import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:devfolio/constants.dart';
import 'package:devfolio/responsive.dart';
import 'package:geolocator/geolocator.dart';
import '../../meteo/meteoModel.dart';
import 'components/side_menu.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  double latitude = 0.0;
  double longitude = 0.0;
  Meteo? data;
  String cityName = '';
  String temp = '';
  var icon;
  var meteoData;
  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied, handle accordingly.
      return;
    }

    if (permission == LocationPermission.denied) {
      // Location permissions are denied, ask for permission.
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Permissions are not granted, handle accordingly.
        return;
      }
    }

    // Location permissions are granted. Proceed to get the location.
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
    data = await getData(latitude, longitude);
    print(longitude);
    setState(() {
      cityName = data?.cityName;
      print(cityName);
    });
  }

  Future<Meteo?> getData(double latitude, double longitude) async {
    var uricall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=13cd770b97bb42c6a17121443232503&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);

    return Meteo.fromJson(body);
  }

  void getMeteoData(latitude, longitude) {
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?lat=${latitude}&lon=${longitude}&appid=541a147950d6e070e2fac5caef476b2c";

    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.meteoData = json.decode(resp.body);
        print(meteoData);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We hide the appbar on desktop
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
              title: Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Align children to the right
                children: [
                  Text(
                    "${cityName} ",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Hubbali',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "| ${temp} °C",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Hubbali',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  meteoData != null &&
                          meteoData['list'] != null &&
                          meteoData['list'].isNotEmpty
                      ? Image.asset(
                          "assets/images/${meteoData['list'][0]['weather'][0]['main'].toString().toLowerCase()}.png",
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          "assets/images/clouds.png",
                          width: 50,
                          height: 50,
                        ),
                ],
              ),
            ),
      drawer: SideMenu(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: SideMenu(),
                ),
              SizedBox(width: defaultPadding),
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(
                    children: widget.children,
                    // our footer
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
