import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app/app_state.dart';
import 'package:resturant_app/model/category.dart';
import 'package:resturant_app/model/event.dart';
import 'package:resturant_app/ui/event_details/event_details_page.dart';
import 'package:resturant_app/ui/homepage/event_widget.dart';// Import EventWidget
import 'package:resturant_app/ui/homepage/catehory_widget.dart';
import 'home_page_background.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: [
            HomePageBackground(screenHeight: MediaQuery.of(context).size.height),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: [
                          Text(
                            'LOCAL EVENT',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.person_outline,
                            color: Color(0x99FFFFFF),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "What's Up",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final category in categories)
                                CategoryWidget(category: category)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: [
                            for (final event in events.where((e) =>
                                e.categoryIds.contains(
                                    appState.selectedCategoryId)))
                              GestureDetector(
                                onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EventDetailsPage(event: event)));
                                },
                                  child: EventWidget(event: event)
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
