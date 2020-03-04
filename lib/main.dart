import 'package:bookingbeauty/navigation_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Beauty',
      theme: ThemeData(
        primaryColor: Color(0xFFF9651E),
      ),
      home: NavigationPage(navigateIndex: 0),
    );
  }
}
