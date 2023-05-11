import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'WEATHER',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 44,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TemperatureText extends StatelessWidget {
  const TemperatureText({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Object data;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$data°',
      style: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 70,
        ),
      ),
    );
  }
}

class MinMaxText extends StatelessWidget {
  const MinMaxText({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    final String text =
        'Макс.: ${list[0].substring(1)}°, Мин.: ${list[1].substring(0, list[1].length - 1)}°';
    return Text(
      text,
      style: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Object data;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$data',
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class CityText extends StatelessWidget {
  const CityText({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String? city;

  @override
  Widget build(BuildContext context) {
    final cityNew = city![0].toUpperCase() + city!.substring(1).toLowerCase();
    return Text(
      cityNew,
      style: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200,
          fontSize: 45,
        ),
      ),
    );
  }
}

class CardText extends StatelessWidget {
  final String text;
  const CardText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.centerLeft,
      child: Text(text,
          style: GoogleFonts.poiretOne(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
