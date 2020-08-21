import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'pages/mobile/mobile_screen.dart';
import 'pages/tablet/tablet_screen.dart';
import 'pages/web/web_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        if (sizingInformation.isDesktop){
          return WebScreen();
        }
        if (sizingInformation.isTablet){
          return TabletScreen();
        }
        return MobileScreen();
      },
    );
  }
}
