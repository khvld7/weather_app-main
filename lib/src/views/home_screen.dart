import 'package:flutter/material.dart';
import 'package:weather_update/src/common/texts.dart';
import 'package:weather_update/src/models/provider.dart';
import 'package:weather_update/src/widgets/home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: heightScreen / 14,
        backgroundColor: const Color.fromARGB(255, 114, 1, 44),
        title: const AppBarText(),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: SearchByCityWidget(),
      ),
    );
  }
}

class SearchByCityWidget extends StatefulWidget {
  const SearchByCityWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchByCityWidget> createState() => _SearchByCityWidgetState();
}

class _SearchByCityWidgetState extends State<SearchByCityWidget> {
  final _model = SearchByCityWidgetModel();
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widthScreen / 12, vertical: heightScreen / 3),
      child: SearchByCityWidgetProvider(
        model: _model,
        child: Column(
          children: const [
            SearchWidget(),
            SizedBox(height: 10),
            InputButtonWidget(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
