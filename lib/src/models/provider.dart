import 'package:flutter/material.dart';
import 'package:weather_update/data/api/api_client.dart';
import 'package:weather_update/src/common/alert_dialog.dart';
import 'package:weather_update/src/views/info_screen.dart';

class SearchByCityWidgetModel extends ChangeNotifier {
  String? city;
  final _apiClient = ApiClient();

  Future<dynamic> onTap(context) async {
    try {
      final response = await _apiClient.getCurrentWeather(city);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => InfoScreen(city: city)));
    } catch (error) {
      AlertDialogs.okDialog(
        context,
        'Ошибка получения данных',
        'Повторите попытку еще раз',
      );
      print("Возникло исключение: $error");
    }

    notifyListeners();
  }
}

class SearchByCityWidgetProvider extends InheritedWidget {
  final SearchByCityWidgetModel model;
  const SearchByCityWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  static SearchByCityWidgetProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SearchByCityWidgetProvider>();
  }

  @override
  bool updateShouldNotify(SearchByCityWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }
}
