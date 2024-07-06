import 'package:flutter/material.dart';

import '../widgets/locations_widget.dart';
import '../widgets/mix_widgets.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        appBar: buildAppBar(),
        body: const LocationsWidget(),
      );

  AppBar buildAppBar() => AppBar(
    iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  wText("IFA's Consultancy", color: Colors.white, size: 24),
        centerTitle: true,
      );
}
