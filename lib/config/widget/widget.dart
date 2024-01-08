import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String text, required ToustStute stute}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToustColor(stute),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToustStute { success, error, warning }

Color choseToustColor(ToustStute stute) {
  Color color;
  switch (stute) {
    case ToustStute.success:
      color = Colors.green;
      break;
    case ToustStute.error:
      color = Colors.red;
      break;
    case ToustStute.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

void navigatorPushAndRemoveUntil(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}void navigatorPush(BuildContext context, Widget widget) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => widget), );
}
