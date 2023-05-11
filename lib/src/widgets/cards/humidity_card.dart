import 'package:flutter/cupertino.dart';
import 'package:weather_update/data/future.dart';
import 'package:weather_update/src/widgets/cards/value_card.dart';
import 'package:weather_update/src/widgets/info_screen_widgets.dart';

class HumidityCard extends StatelessWidget {
  const HumidityCard({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String? city;
  final Icon = CupertinoIcons.drop;
  final String Text = 'ВЛАЖНОСТЬ';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FutureWidgets(city).humidity(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return Stack(
              children: [
                CardNameWidget(icon: Icon, text: Text),
                ValueCard(data: data),
              ],
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
