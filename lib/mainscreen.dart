// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weather_api/weather.dart';
import 'package:weather_api/weather_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();
  
  String currentWeather = '';
  double temp = 0;
  String icon = '';
  String condition = '';
  
  
  
  
  
  void getWeather() async {
    weather = await weatherService.getWeatherData(_textController.text);
    setState(() {
      condition = weather.condition;
      temp = weather.temp;
      icon = weather.icon;
    });
  }
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 60, 12, 172), Color.fromARGB(255, 113, 0, 133)],begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                TextField(
                  controller: _textController,
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(59, 255, 255, 255),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular (25),
                    borderSide: BorderSide.none,
                    ), 
                  hintText: "type city/country",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Color.fromARGB(183, 255, 254, 255),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton.icon(
                      onPressed: () {setState(() {
                          getWeather();
                        
                      });},
                      icon: Icon(Icons.cloud),
      
                      label: Text('Search'),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            //side: BorderSide(color: Colors.red)
                          )
                        ),
                        backgroundColor:  MaterialStateProperty.all<Color>(Color.fromARGB(109, 128, 62, 204))
                      ),
      
                    ),
      
                  
                
                SizedBox(height: 50,),
                Image.network(icon == ''? 'https://www.gstatic.com/youtube/src/web/htdocs/img/monkey.png':'https:$icon',
                              fit: BoxFit.fill,height: 200,color: Colors.white.withOpacity(0.8), colorBlendMode: BlendMode.modulate,),
                
                Text(condition, style: TextStyle(color: Color.fromARGB(185, 255, 255, 255), fontSize: 40,fontWeight: FontWeight.bold)),
                Text('$temp  Celsius', style: TextStyle(fontSize: 30,color: Color.fromARGB(185, 255, 255, 255))),
                SizedBox(height:150),
                Text('This data is taken from weatherapi.com',style: TextStyle(fontSize: 19, color: Colors.white30)),
                SizedBox(height: 400,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}