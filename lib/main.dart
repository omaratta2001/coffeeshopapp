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
      builder: (context, child) {
        // Clamp text scale factor to prevent excessive scaling
        final mediaQueryData = MediaQuery.of(context);
        final clampedTextScaler = mediaQueryData.textScaler.clamp(
          minScaleFactor: 0.9, // Minimum scale factor (usually 1.0)
          maxScaleFactor: 0.9, // Maximum scale factor (adjust as needed)
        );

        return MediaQuery(
          // Override textScaler with the clamped value
          data: mediaQueryData.copyWith(textScaler: clampedTextScaler),
          child: child!,
        );
      },
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
