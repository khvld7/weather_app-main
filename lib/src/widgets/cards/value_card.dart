import 'package:flutter/material.dart';
import 'package:weather_update/src/widgets/info_screen_widgets.dart';

class ValueCard extends StatelessWidget {
  const ValueCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Object data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const DividerCard(),
        Card(
          margin: const EdgeInsets.only(),
          color: const Color.fromARGB(255, 114, 1, 44),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: SizedBox(
            width: 130,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$data',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
