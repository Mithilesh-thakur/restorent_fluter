import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app/model/event.dart';
import 'package:resturant_app/model/guest.dart';

class EventDetailsContent extends StatelessWidget {
  const EventDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
        children: [
          SizedBox(height: 100),

          // Event Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: Text(
              event.title,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 20),

          // Event Location
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.24),
            child: Row(
              children: [
                FittedBox(
                  child: Row(
                    children: [
                      Text(
                        "-",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          
                        ),
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        event.location,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 80),

          // Guests Section
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "GUESTS",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final guest in guests) // Use event.guests instead of undefined guests list
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        guest.imagePath,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Event Punchlines
          Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: event.punchLine1,
                    style: TextStyle(color: Colors.orange, fontSize: 25),
                  ),
                  TextSpan(
                    text: event.punchLine2,
                    style: TextStyle(color: Colors.orange, fontSize: 19),
                  ),
                ],
              ),
            ),
          ),

          // Event Description
          if (event.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                event.description,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),

          // Gallery Section
          if (event.galleryImages.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16),
              child: Text(
                "GALLERY",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final galleryImagePath in event.galleryImages)
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 32,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          galleryImagePath,
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
