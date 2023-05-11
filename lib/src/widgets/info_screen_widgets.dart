import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_update/data/future.dart';
import 'package:weather_update/src/common/texts.dart';
import 'package:weather_update/src/views/info_screen.dart';

class InfoScreenAppBar extends StatelessWidget {
  const InfoScreenAppBar({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String? city;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: AppBarText(),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => InfoScreen(city: city)));
          },
          icon: const Icon(CupertinoIcons.restart),
        ),
      ],
    );
  }
}

class CityTextWidget extends StatelessWidget {
  const CityTextWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String? city;

  @override
  Widget build(BuildContext context) {
    return CityText(city: city);
  }
}

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String? city;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FutureWidgets(city).temp(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return TemperatureText(data: data);
        } else {
          return const Center(
            child: Text(
              '- - -',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          );
        }
      },
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String? city;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FutureWidgets(city).description(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return DescriptionText(data: data);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class MinMaxTempWidget extends StatelessWidget {
  const MinMaxTempWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String? city;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FutureWidgets(city).tempMinMax(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          String data_string = data.toString();
          List<String> list = data_string.split(', ');
          return MinMaxText(list: list);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class DividerCard extends StatelessWidget {
  const DividerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 2,
      color: Colors.black,
    );
  }
}

class CardNameWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const CardNameWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 5),
      color: const Color.fromARGB(255, 186, 39, 94),
      shadowColor: Colors.black,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
            CardText(text: text),
          ],
        ),
      ),
    );
  }
}
