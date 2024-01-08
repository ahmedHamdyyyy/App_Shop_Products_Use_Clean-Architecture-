import 'package:flutter/material.dart';

class Utils {
  static void errorDialog(BuildContext context, String error, {void Function()? onPressed}) => showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(error),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: ()               => Navigator.pop(context), child: const Text('dismiss')),
                TextButton(onPressed: onPressed, child: const Text('Retry')),
              ],
            ),
          ],
        ),
      ),
    ),
  );



  static Future loadingDialog(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Loading', style: Theme.of(context).textTheme.headlineMedium),
              const Center(child: LinearProgressIndicator()),
            ],
          ),
        ),
      ),
    ),
  );}