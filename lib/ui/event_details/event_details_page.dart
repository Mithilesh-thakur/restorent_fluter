import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app/model/event.dart';
import 'package:resturant_app/ui/event_details/event_details_background.dart';
import 'package:resturant_app/ui/event_details/event_details_content.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: event,
        child: Stack(
          fit: StackFit.expand,
          children: [
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
    );
  }
}
