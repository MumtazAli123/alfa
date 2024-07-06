import 'package:flutter/material.dart';

import '../model/location.dart';
import '../page/detail_page.dart';
import 'expanded_content_widget.dart';
import 'image_widget.dart';

class LocationWidget extends StatefulWidget {
  final Location location;

  const LocationWidget({required this.location, super.key});

  @override
  LocationWidgetState createState() => LocationWidgetState();
}

class LocationWidgetState extends State<LocationWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onPanUpdate: onPanUpdate,
          onTap: openDetailPage,
          child: SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.5,
            child: ImageWidget(
                location: widget.location, image: widget.location.imageUrl),
          ),
        ),
      ],
    );
  }

  void openDetailPage() {
    if (!isExpanded) {
      setState(() => isExpanded = true);
      return;
    }

    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child: DetailPage(location: widget.location, animation: animation),
          );
        },
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
