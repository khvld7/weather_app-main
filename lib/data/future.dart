import 'package:weather_update/data/api/api_client.dart';

class FutureWidgets {
  final String? city;
  FutureWidgets(this.city);
  final ApiClient _apiClient = ApiClient();

  Future temp() async {
    final response = await _apiClient.getCurrentWeather(city);
    dynamic x = response.temp;
    int a = x.round();
    return a;
  }

  Future<dynamic> description() async {
    final response = await _apiClient.getCurrentWeather(city);
    final x = response.weathers[0].description;
    return x;
  }

  Future<dynamic> wind() async {
    final response = await _apiClient.getCurrentWeather(city);
    dynamic x = response.wind;
    return x;
  }

  Future<dynamic> humidity() async {
    final response = await _apiClient.getCurrentWeather(city);
    dynamic x = response.humidity;
    return x;
  }

  Future tempMinMax() async {
    final response = await _apiClient.getCurrentWeather(city);
    dynamic x = response.tempMin;
    dynamic y = response.tempMax;
    int a = x.round();
    int b = y.round();
    List result = [];
    result.add(a);
    result.add(b);
    return result;
  }
}
