import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop: () async=> false,
      child: Scaffold(
        appBar: AppBar(
          title:
          const Text("  Shop",style: TextStyle(
            fontSize: 20
          ),),
          actions: [
            iconsThemeChange(),
          ],
        ),
        body: buildBlocConsumerBodyHomeProducts(),
      ),
    );
  }

}
