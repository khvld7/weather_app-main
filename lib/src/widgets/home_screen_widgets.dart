import 'package:flutter/material.dart';
import 'package:weather_update/src/models/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      maxLines: 1,
      cursorHeight: 19,
      cursorColor: Colors.black,
      style: const TextStyle(
        decoration: TextDecoration.none,
        color: Colors.black,
        fontSize: 19,
      ),
      onChanged: (value) =>
          SearchByCityWidgetProvider.of(context)?.model.city = value,
      onSubmitted: (value) =>
          SearchByCityWidgetProvider.of(context)?.model.onTap(context),
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 25,
        ),
        hintText: 'Введите название города',
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 19,
        ),
        contentPadding: EdgeInsets.symmetric(),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide:
              BorderSide(color: Color.fromARGB(255, 186, 39, 94), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide:
              BorderSide(color: Color.fromARGB(255, 114, 1, 44), width: 4),
        ),
      ),
    );
  }
}

class InputButtonWidget extends StatelessWidget {
  const InputButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.all(const Color.fromARGB(75, 25, 25, 25)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 186, 39, 94)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: () =>
          SearchByCityWidgetProvider.of(context)?.model.onTap(context),
      child: const Text(
        'Подтвердить',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
