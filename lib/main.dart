import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Controller/Provider/CartScreenProvider.dart';
import 'package:coffeeshopapp/Controller/Provider/HomeScreenProvider.dart';
import 'package:coffeeshopapp/Controller/Provider/Productdetails.dart';
import 'package:coffeeshopapp/Pages/Splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => Homescreenprovider()..initializeCounter()),
        ChangeNotifierProvider(
            create: (_) => Cartscreenprovider()..initializeCounter()),
        ChangeNotifierProvider(create: (_) => Productdetailsprovider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffe Shop App',
      theme: ThemeData(
        scaffoldBackgroundColor: black,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
