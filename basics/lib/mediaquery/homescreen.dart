import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Grid Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Number of columns in the grid
    final int gridCount = MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Grid Layout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: gridCount,
              childAspectRatio: 8.0 / 9.0,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              padding: EdgeInsets.all(4),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              children: List.generate(4, (index) {
                // Placeholder for your card widget
                return Card(
                  child: Center(
                    child: Text(
                      'Card $index',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            // The larger featured card
            Card(
              elevation: 2.0,
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.network(
                    'https://via.placeholder.com/350x150',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Job Search',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      'Find yourself the best opportunities in Nairobi and all over Kenya!',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigate to job search screen
                        },
                        child: Text('EXPLORE JOBS'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
