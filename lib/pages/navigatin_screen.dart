import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.only(
                  right: 44, left: 44, top: 28, bottom: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      GestureDetector(
                        onTap: () {
                          logoutDialog(context);
                        },
                        child: CircleAvatar(
                          radius: 24,
                          foregroundImage: NetworkImage(
                              FirebaseAuth.instance.currentUser!.photoURL!),
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
                              MaterialPageRoute(
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
                                  MaterialPageRoute(
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
                                  MaterialPageRoute(
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

  void logoutDialog(BuildContext context) {
    var dialog = AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: CustomText(
        textName: "Logout",
        fontSize: 20,
        textColor: Theme.of(context).textTheme.labelLarge!.color,
        fontWeight: FontWeight.bold,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.17,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
                fontWeight: FontWeight.w600,
                maxLines: 10,
                lineHeight: 1.6,
                textColor: Theme.of(context).textTheme.labelMedium!.color,
                textName: "Do You Want To Log Out ?"),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                          color: Theme.of(context).textTheme.titleMedium!.color,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: CustomText(
                        textName: "LogOut",
                        textColor:
                            Theme.of(context).textTheme.titleLarge!.color,
                        fontSize: 12,
                      ),
                    ),
                  ),
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
