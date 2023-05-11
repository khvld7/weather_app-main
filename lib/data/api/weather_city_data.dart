import 'dart:convert';

WeatherCurrentData? weatherCityFromJson(String str) =>
    WeatherCurrentData?.fromJson(json.decode(str));

class WeatherCurrentData {
  final String? city;
  final dynamic temp;
  final dynamic tempMin;
  final dynamic tempMax;
  final dynamic humidity;
  final dynamic wind;
  final int? cod;
  final List<Weather> weathers;

  WeatherCurrentData({
    required this.city,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.wind,
    required this.cod,
    required this.weathers,
  });

  factory WeatherCurrentData.fromJson(Map<String, dynamic> json) =>
      WeatherCurrentData(
        city: json["name"],
        temp: json['main']["temp"],
        tempMin: json['main']["temp_min"],
        tempMax: json['main']["temp_max"],
        humidity: json['main']['humidity'],
        wind: json['wind']['speed'],
        cod: json['cod'],
        weathers:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );
}

class Weather {
  final int? id;
  final String? main;
  final String? description;

  Weather({
    required this.id,
    required this.main,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
      );
}
