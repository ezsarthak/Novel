import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../components/loading_widget.dart';
import '../components/novel_text.dart';
import '../pages/home_screen.dart';
import '../pages/login_screen.dart';
import '../services/load_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<List<String>> imgObject;

  @override
  void initState() {
    imgObject = LoadWidget.getwidgets(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasData) {
            return FutureBuilder<List<String>>(
              future: imgObject.whenComplete(
                  () => Future.delayed(const Duration(milliseconds: 2000))),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return NavBarScreen(
                    snapshot: snapshot,
                  );
                } else {
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
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.35,
                            ),
                            child: const Center(child: LoadingWidget()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: CustomText(
                                    textName: 'App Starting',
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 2,
                                    fontSize: 12,
                                    textColor: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .color!
                                        .withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Center(
                                  child: SpinKitWave(
                                    size:
                                        MediaQuery.of(context).size.width * 0.1,
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .color!
                                        .withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return const LogIn();
          }
        },
      ),
    );
  }
}
