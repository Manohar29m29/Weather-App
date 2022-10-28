import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_api/weather.dart';

class WeatherService {
  Future<Weather> getWeatherData(String place) async {
    try {
      final queryParameters = {
        'key' : 'a58db8c8980848a1ae1125136222710',
        'q' : place
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Can not get weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}


