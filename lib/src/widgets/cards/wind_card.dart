import 'package:flutter/cupertino.dart';
import 'package:weather_update/data/future.dart';
import 'package:weather_update/src/widgets/cards/value_card.dart';
import 'package:weather_update/src/widgets/info_screen_widgets.dart';

class WindCard extends StatelessWidget {
  const WindCard({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String? city;
  final icon = CupertinoIcons.wind;
  final String text = 'ВЕТЕР';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FutureWidgets(city).wind(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return Stack(
              children: [
                CardNameWidget(icon: icon, text: text),
                ValueCard(data: data),
              ],
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
