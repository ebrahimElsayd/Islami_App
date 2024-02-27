import 'package:flutter/material.dart';
import 'package:islamiapp/hadith_Details/hadithDetails.dart';
import 'package:islamiapp/homescreen.dart';
import 'package:islamiapp/provider/my_provider.dart';
import 'package:islamiapp/surahdetails/surah_details.dart';
import 'package:islamiapp/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      locale: Locale("en"),
      //  title: 'Flutter Demo',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Surah_Details.routName: (context) => Surah_Details(),
        HadithDetails.routeName: (context) => HadithDetails(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,

      darkTheme: Themes.darkTheme,
    );
  }
}
