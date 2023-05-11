import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:weather_update/data/api/weather_city_data.dart';

class ApiClient {
  Future<WeatherCurrentData> getCurrentWeather(String? city) async {
    final client = RetryClient(http.Client());

    final response = await client.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=1f393269e22cd5a9eef96124a1301226&units=metric&lang=ru'));

    final WeatherCurrentData items;
    items = WeatherCurrentData.fromJson(jsonDecode(response.body));
    return items;
  }
}
