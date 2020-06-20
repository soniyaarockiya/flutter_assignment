import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/screens/root_screen.dart';
import 'screens/available_crypto.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white, scaffoldBackgroundColor: Colors.white),
      initialRoute: RootScreen.id,
      routes: {
        RootScreen.id: (context) => RootScreen(),
        AvailableCryptoScreen.id: (context) => AvailableCryptoScreen(),
      },
    );
  }
}
