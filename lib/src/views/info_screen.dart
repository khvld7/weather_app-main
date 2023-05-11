import 'package:flutter/material.dart';
import 'package:weather_update/src/widgets/cards/humidity_card.dart';
import 'package:weather_update/src/widgets/cards/wind_card.dart';
import 'package:weather_update/src/widgets/info_screen_widgets.dart';

class InfoScreen extends StatelessWidget {
  final String? city;
  const InfoScreen({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: heightScreen / 14,
        backgroundColor: const Color.fromARGB(255, 114, 1, 44),
        title: InfoScreenAppBar(city: city),
        centerTitle: true,
      ),
      body: WeatherInfo(city: city),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final String? city;
  const WeatherInfo({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 50),
      child: Column(
        children: [
          CityTextWidget(city: city),
          TemperatureWidget(city: city),
          DescriptionWidget(city: city),
          const SizedBox(height: 10),
          MinMaxTempWidget(city: city),
          const SizedBox(height: 100),
          WindCard(city: city),
          const SizedBox(height: 15),
          HumidityCard(city: city),
        ],
      ),
    );
  }
}
