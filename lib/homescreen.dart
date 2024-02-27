import 'package:flutter/material.dart';
import 'package:islamiapp/tabs/ahadeth.dart';
import 'package:islamiapp/tabs/quran.dart';
import 'package:islamiapp/tabs/radio.dart';
import 'package:islamiapp/tabs/sebha.dart';
import 'package:islamiapp/tabs/settings.dart';
import 'package:islamiapp/themes.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Text(
                'Islami',
                style: Theme.of(context).textTheme.bodyLarge,
              )),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  backgroundColor:Themes.primary,
                  icon:  ImageIcon(
                    AssetImage("assets/images/radio.png"),
                  ),
                  label: "radio"),
              BottomNavigationBarItem(
                  backgroundColor: Themes.primary,
                  icon: ImageIcon(
                    AssetImage("assets/images/sebha.png"),
                  ),
                  label: "sebha"),
              BottomNavigationBarItem(
                  backgroundColor: Themes.primary,
                  icon: ImageIcon(
                    AssetImage("assets/images/qurann.png"),
                  ),
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  backgroundColor: Themes.primary,
                  icon: ImageIcon(
                    AssetImage("assets/images/quran.png"),
                  ),
                  label: "quran"),
              BottomNavigationBarItem(
                  backgroundColor: Themes.primary,
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "Settings")
            ],
          ),
          body: tabs[index],
        )

      ],
    );

  }
  List<Widget>tabs= [
    RadioTab(),
    SebhaTab(),
    AhadethTab(),
    QuranTab(),
    SettingsTab()
  ];
}
