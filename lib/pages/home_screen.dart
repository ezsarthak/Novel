import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novel/setup/app_details.dart';
import '../components/novel_text.dart';
import '../pages/other_apps_screen.dart';
import '../pages/settings_screen.dart';
import '../pages/wallpapers_screen.dart';
import '../pages/widgets_screen.dart';

class NavBarScreen extends StatelessWidget {
  final AsyncSnapshot<List<String>> snapshot;
  const NavBarScreen({Key? key, required this.snapshot}) : super(key: key);

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
              padding: const EdgeInsets.only(
                  right: 44, left: 44, top: 28, bottom: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomText(
                            textName: appName,
                            fontSize: 32,
                            textColor:
                                Theme.of(context).textTheme.labelLarge!.color,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            textName: "Featured",
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            textColor:
                                Theme.of(context).textTheme.labelLarge!.color,
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 24,
                        foregroundImage: NetworkImage(
                            FirebaseAuth.instance.currentUser!.photoURL!),
                      ),
                    ],
                  ),

                  // const SizedBox(
                  //   height: 12,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => WidgetScreen(
                                    snapshot: snapshot,
                                  )));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.43,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(32),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage("assets/app elements/Widgets.png"),
                          )),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  CustomText(
                    textName: "More",
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    letterSpacing: 2,
                    textColor: Theme.of(context).textTheme.labelLarge!.color,
                  ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Wallpapers(
                                        snapshot: snapshot,
                                      )));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.31,
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(28),
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/app elements/Wallpaper.png"),
                              )),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => OtherApps(
                                            snapshot: snapshot,
                                          )));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: MediaQuery.of(context).size.width * 0.33,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(28),
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/app elements/MoreApps.png"),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const SettingsScreen()));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.red,
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/app elements/Settings.png"),
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
