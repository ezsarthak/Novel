// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/dimensions.dart';
import '../setup/app_details.dart';
import 'package:provider/provider.dart';
import '../components/novel_text.dart';
import '../pages/other_apps_screen.dart';
import '../pages/settings_screen.dart';
import '../pages/wallpapers_screen.dart';
import '../pages/widgets_screen.dart';
import '../utils/novel_provider.dart';
import 'splash_screen.dart';

class NavigationScreen extends StatelessWidget {
  final AsyncSnapshot<List<String>> snapshot;
  const NavigationScreen({Key? key, required this.snapshot}) : super(key: key);

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
              padding: Dimensions.pagePadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            textName: appName,
                            fontSize: 28,
                            textColor:
                                Theme.of(context).textTheme.labelLarge!.color,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.63,
                            child: CustomText(
                              textName: appDescription,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              fontWeight: FontWeight.w200,
                              fontSize: 10,
                              textColor:
                                  Theme.of(context).textTheme.labelLarge!.color,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          logoutDialog(context);
                        },
                        child: const CircleAvatar(
                          radius: 24,
                          foregroundImage: AssetImage(
                              "assets/app elements/app_logo.jpg"),
                        ),
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
                          MaterialPageRoute(
                              builder: (context) => WidgetScreen(
                                    snapshot: snapshot,
                                  )));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(32),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
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
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 4,
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
                              MaterialPageRoute(
                                  builder: (context) => const Wallpapers()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.42,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(28),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
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
                                  MaterialPageRoute(
                                      builder: (context) => OtherApps(
                                            snapshot: snapshot,
                                          )));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.16,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(28),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingsScreen()));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.16,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.red,
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/app elements/Settings.png"),
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void logoutDialog(BuildContext context) {
    var dialog = AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: Center(
        child: Icon(
          Iconsax.warning_2,
          size: 52,
          color: Theme.of(context).indicatorColor,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
                fontWeight: FontWeight.w800,
                maxLines: 1,
                fontSize: 12,
                letterSpacing: 0.8,
                textColor: Theme.of(context).textTheme.labelMedium!.color,
                textName: "Are You Sure Want To Log Out ?"),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).textTheme.titleMedium!.color,
                          borderRadius: BorderRadius.circular(12)),
                      child: CustomText(
                        textName: "Cancel",
                        textColor:
                            Theme.of(context).textTheme.titleLarge!.color,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final provider =
                          Provider.of<MyAppProvider>(context, listen: false);
                      provider.logOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Theme.of(context).indicatorColor,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: CustomText(
                        textName: "Yes",
                        textColor: Theme.of(context).cardColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
