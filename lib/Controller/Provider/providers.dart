// providers.dart
import 'package:coffeeshopapp/Controller/Provider/HomeScreenProvider.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> appProviders = [
  ChangeNotifierProvider(create: (_) => Homescreenprovider()),
  //ChangeNotifierProvider(create: (_) => YourSecondProvider()),
  // زود براحتك هنا
];
