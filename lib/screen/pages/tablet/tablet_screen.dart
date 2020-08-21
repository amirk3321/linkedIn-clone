import 'package:flutter/material.dart';
import 'package:linkedin_clone/screen/pages/tablet/nav_bar_tablet.dart';
import 'package:linkedin_clone/screen/pages/web/body_content.dart';

class TabletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            NavBarTablet(),
            Expanded(child: BodyContent()),
          ],
        ),
      ),
    );
  }
}
