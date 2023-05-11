import 'package:flutter/material.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> okDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 184, 178, 178),
                fontSize: 22,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 114, 1, 44),
            content: Text(
              body,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(DialogsAction.cancel),
                child: const Text(
                  'OK',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
    return (action != null) ? action : DialogsAction.cancel;
  }
}
