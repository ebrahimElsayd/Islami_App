import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/surah_model.dart';
import 'package:islamiapp/themes.dart';

class Surah_Details extends StatefulWidget {
  static const String routName = 'surah_details';

  @override
  State<Surah_Details> createState() => _Surah_DetailsState();
}

class _Surah_DetailsState extends State<Surah_Details> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(
            title:
                Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Card(
            elevation: 10,
            margin: EdgeInsets.all(18),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Themes.primary)),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return  Divider(

                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "${verses[index]}(${index + 1})",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 25),
                  ),
                );
              },
              itemCount: verses.length,
            ),
          )),
    );
  }

  void loadFile(index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = sura.trim().split('\n');
    verses = lines;
    print(verses);
    setState(() {});
  }
}
