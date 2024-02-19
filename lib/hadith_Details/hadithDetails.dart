import 'package:flutter/material.dart';
import 'package:islamiapp/hadith_model.dart';
import 'package:islamiapp/themes.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName = "hadithDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(
            title:
                Text(args.title, style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Card(
            elevation: 10,
            margin: EdgeInsets.all(18),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Themes.primary)),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "${args.content[index]})",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 25),
                  ),
                );
              },
              itemCount: args.content.length,
            ),
          )),
    );
  }
}
