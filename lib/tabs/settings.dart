import 'package:flutter/material.dart';
import 'package:islamiapp/bottomSheet/languageBottomSheet.dart';
import 'package:islamiapp/themes.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Language", style: Theme.of(context).textTheme.bodyLarge),
          InkWell(
            onTap: () {
              ShowLanguageModelSheet(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Themes.primary, width: 2)),
              child:
                  Text("English", style: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text("Mode", style: Theme.of(context).textTheme.bodyLarge),
          InkWell(
            onTap: () {
              ShowThemingModelSheet(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Themes.primary, width: 2)),
              child:
                  Text("Light", style: Theme.of(context).textTheme.bodyLarge),
            ),
          )
        ],
      ),
    );
  }

  void ShowLanguageModelSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  void ShowThemingModelSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) {
        return Container();
      },
    );
  }
}
