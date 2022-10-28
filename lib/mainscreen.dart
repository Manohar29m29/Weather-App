// ignore_for_file: prefer_const_constructors

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
  double tempC = 0;
  double tempF = 0;
  
  
  void getWeather() async {
    weather = await weatherService.getWeatherData(_textController.text);
    setState(() {
      currentWeather = weather.condition;
      tempF = weather.temperatureF;
      tempC = weather.temperatureC;
    });
  }
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 40,
        backgroundColor: Color.fromARGB(24, 23, 41, 102),  
        title: Text('Weather  Temperature', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),

      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.cyan[500]
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'Type City/Country',
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(50.0))
                      ),
                      //hintText: 'Type city or country name',
                      suffixIcon: IconButton(
                        onPressed: () {_textController.clear();}, 
                        icon: Icon(Icons.clear, color: Colors.white60,)
                      )
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {setState(() {
                        getWeather();
                      
                    });},
                    icon: Icon(Icons.search),

                    label: Text('Search'),
                    style: ButtonStyle(


                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          //side: BorderSide(color: Colors.red)
                        )
                      ),
                      backgroundColor:  MaterialStateProperty.all<Color>(Color.fromARGB(255, 74, 130, 177))
                    ),

                  ),

                ],
              ),
              SizedBox(height: 50,),
              
              Text(currentWeather, style: TextStyle(color: Colors.blue[900], fontSize: 40,fontWeight: FontWeight.bold)),
              Text('${tempC.toString()}  Celsius', style: TextStyle(fontSize: 30)),
              Text('${tempF.toString()}  Fahrenheit', style: TextStyle(fontSize: 30)),
              SizedBox(height:100),
              Text('This data is taken from weatherapi.com',style: TextStyle(fontSize: 19))
            ],
          ),
        ),
      ),
    );
  }
}