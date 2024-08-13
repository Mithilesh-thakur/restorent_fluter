import 'package:flutter/material.dart';
import '../../model/event.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 20),
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all( Radius.circular(30)),
                child: Image.asset(
                  event.imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              event.title,
                               style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                   ),
                          ),
                          SizedBox(height: 8),
                          FittedBox(
                            child: Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(width: 5,),
                                Text(event.location)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        event.duration.toLowerCase() ,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      );

  }
}
