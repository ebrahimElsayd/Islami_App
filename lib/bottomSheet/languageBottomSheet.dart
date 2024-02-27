import 'package:flutter/material.dart';
import 'package:islamiapp/provider/my_provider.dart';
import 'package:islamiapp/themes.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "English",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Themes.primary),
                ),
                Icon(
                  Icons.done,
                  color: Themes.primary,
                  size: 30,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Arabic",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Themes.blackColor),
                ),
                SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
