import 'package:flutter/material.dart';

import '../components/novel_text.dart';

class OtherApps extends StatefulWidget {
  final AsyncSnapshot<List<String>> snapshot;
  const OtherApps({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<OtherApps> createState() => _OtherAppsState();
}

class _OtherAppsState extends State<OtherApps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight,
            Theme.of(context).backgroundColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(right: 44, left: 44, top: 28, bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                textName: "More Apps",
                fontSize: 32,
                textColor: Theme.of(context).textTheme.labelLarge!.color,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomText(
                textName: "Featured",
                fontWeight: FontWeight.w300,
                fontSize: 24,
                textColor: Theme.of(context).textTheme.labelLarge!.color,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
