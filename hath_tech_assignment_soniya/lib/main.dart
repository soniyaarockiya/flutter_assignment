import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/screens/root_screen.dart';
import 'package:heth_tech_assignment_soniya/services/provider_service.dart';
import 'screens/available_crypto.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderData>(
      create: (context) => ProviderData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.white, scaffoldBackgroundColor: Colors.white),
        initialRoute: RootScreen.id,
        routes: {
          RootScreen.id: (context) => RootScreen(),
          AvailableCryptoScreen.id: (context) => AvailableCryptoScreen(),
        },
      ),
    );
  }
}
