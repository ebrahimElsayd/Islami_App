import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/hadith_Details/hadithDetails.dart';
import 'package:islamiapp/hadith_model.dart';
import 'package:islamiapp/themes.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> AllAhadith = [];

  @override
  Widget build(BuildContext context) {
    if (AllAhadith.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            'assets/images/hadith_logo.png',
            alignment: Alignment.center,
          ),
        ),
        const Divider(
          thickness: 3,
          color: Themes.primary,
        ),
        Text("الأحاديث",
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 30)),
        const Divider(
          thickness: 3,
          color: Themes.primary,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                endIndent: 40,
                indent: 40,
                color: Themes.primary,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadithDetails.routeName,
                      arguments: AllAhadith[index]);
                },
                child: Text(
                  "${AllAhadith[index].title}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: AllAhadith.length,
          ),
        )
      ],
    );
  }

  void loadFile() async {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.trim().split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadethModel hadethModel = HadethModel(content, title);
        print(i);
        print(title);
        AllAhadith.add(hadethModel);
      }
      setState(() {});
    }).catchError((e) {
      print(e.toString());
      print("someting errotr");
    });
  }
}
