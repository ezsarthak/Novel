// ignore_for_file: deprecated_member_use, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:iconsax/iconsax.dart';
import '../pages/splash_screen.dart';
import '../components/novel_settings_tile.dart';
import '../components/settings_panel.dart';
import '../components/snackbar.dart';
import '../constants/dimensions.dart';
import 'about_screen.dart';
import '../utils/novel_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/novel_button.dart';
import '../components/novel_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final providerChange = Provider.of<MyAppProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight,
            Theme.of(context).backgroundColor,
          ],
          // Colors.amber.shade100,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 44, left: 44, top: 28, bottom: 28),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textName: "Settings",
                    fontSize: 32,
                    textColor: Theme.of(context).textTheme.labelLarge!.color,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    textName: "Change Preferences",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    maxLines: 1,
                    textColor: Theme.of(context).textTheme.labelLarge!.color,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    children: [
                      SettingsPanel(panelName: 'UI', items: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomButton(
                                borderRadius: Dimensions.smallCornerRadius,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.1,
                                    vertical: 25),
                                backgroundColor: providerChange.darkTheme
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).indicatorColor,
                                onPressed: () {
                                  providerChange.darkTheme = false;
                                },
                                buttonContent: CustomText(
                                  textName: "Light",
                                  fontWeight: FontWeight.w700,
                                  textColor: Theme.of(context).hintColor,
                                  fontSize: 20,
                                )),
                            CustomButton(
                                borderRadius: Dimensions.smallCornerRadius,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                    vertical: 25),
                                backgroundColor: providerChange.darkTheme
                                    ? Theme.of(context).indicatorColor
                                    : Theme.of(context).cardColor,
                                onPressed: () {
                                  providerChange.darkTheme = true;
                                },
                                buttonContent: CustomText(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  textColor: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .color,
                                  textName: "Dark",
                                ))
                          ],
                        )
                      ]),
                      SettingsPanel(panelName: 'Widget Background', items: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomButton(
                                borderRadius: Dimensions.smallCornerRadius,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.1,
                                    vertical: 25),
                                backgroundColor: providerChange.bg
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).indicatorColor,
                                onPressed: () {
                                  setState(() {
                                    providerChange.widgetbg = false;
                                  });

                                  // themeChange.darkTheme = false;
                                },
                                buttonContent: CustomText(
                                  textName: "Black",
                                  fontWeight: FontWeight.w700,
                                  textColor: providerChange.bg == false
                                      ? Theme.of(context).hintColor
                                      : Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .color,
                                  fontSize: 20,
                                )),
                            CustomButton(
                                borderRadius: Dimensions.smallCornerRadius,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                    vertical: 25),
                                backgroundColor: providerChange.bg
                                    ? Theme.of(context).indicatorColor
                                    : Theme.of(context).cardColor,
                                onPressed: () {
                                  setState(() {
                                    providerChange.widgetbg = true;
                                  });
                                },
                                buttonContent: CustomText(
                                  fontSize: 20,
                                  textColor: providerChange.bg == true
                                      ? Theme.of(context).hintColor
                                      : Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .color,
                                  textName: "Grey",
                                  fontWeight: FontWeight.w700,
                                ))
                          ],
                        )
                      ]),
                      SettingsPanel(
                        panelName: 'About Us',
                        items: [
                          CustomSettingsTile(
                            title: 'Know More',
                            subtitle: 'via Twitter, Telegram',
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const AboutScreen()))),
                            trailing: CustomButton(
                              backgroundColor: Colors.transparent,
                              // padding: const EdgeInsets.all(10),
                              buttonContent: Icon(
                                Iconsax.send_2,
                                size: 24,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SettingsPanel(
                        panelName: 'Storage',
                        items: [
                          CustomSettingsTile(
                            title: 'Clear Cache',
                            trailing: CustomButton(
                              backgroundColor: Colors.transparent,
                              // padding: const EdgeInsets.all(10),
                              buttonContent: Icon(
                                Iconsax.trash,
                                size: 24,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.7),
                              ),
                            ),
                            onTap: () {
                              DefaultCacheManager().emptyCache();
                              imageCache.clear();
                              imageCache.clearLiveImages();
                              setState(() {});
                              getSnackBar(context, "Cache Cleared");
                            },
                          ),
                        ],
                      ),
                      SettingsPanel(panelName: "Feedback", items: [
                        CustomSettingsTile(
                          title: "Rate App",
                          trailing: CustomButton(
                            backgroundColor: Colors.transparent,
                            // padding: const EdgeInsets.all(10),
                            buttonContent: Icon(
                              Iconsax.like,
                              size: 24,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.7),
                            ),
                          ),
                          onTap: () async {
                            String uri =
                                'https://play.google.com/store/apps/details?id=dev.sarthak.symmetrics&hl=en-US&ah=PulkBdlLgWInFlz21YErqShEXLI';
                            if (await canLaunch(uri)) {
                              await launch(uri);
                            } else {
                              getSnackBar(context, "No Browser found");
                              print("No Browser found");
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomSettingsTile(
                          title: "Report Bug",
                          trailing: CustomButton(
                            backgroundColor: Colors.transparent,
                            // padding: const EdgeInsets.all(10),
                            buttonContent: Icon(
                              Iconsax.danger,
                              size: 24,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.7),
                            ),
                          ),
                          onTap: () async {
                            const String subject = "Report Bug For Symmectrics";
                            const String stringText =
                                "Enter Details Of Bug Here And Send";
                            String uri =
                                'mailto:thesarthakdesigns@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(stringText)}';
                            if (await canLaunch(uri)) {
                              await launch(uri);
                            } else {
                              getSnackBar(context, "No email client found");
                              print("No email client found");
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomSettingsTile(
                          title: "Give Suggestions",
                          trailing: CustomButton(
                            backgroundColor: Colors.transparent,
                            // padding: const EdgeInsets.all(10),
                            buttonContent: Icon(
                              Iconsax.add_square,
                              size: 24,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.7),
                            ),
                          ),
                          onTap: () async {
                            const String subject =
                                "Suggestions For Symmectrics";
                            const String stringText =
                                "Enter Details Of Your Suggestions, Feel Free To Send";
                            String uri =
                                'mailto:thesarthakdesigns@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(stringText)}';
                            if (await canLaunch(uri)) {
                              await launch(uri);
                            } else {
                              getSnackBar(context, "No email client found");
                              print("No email client found");
                            }
                          },
                        ),
                      ]),
                      SettingsPanel(
                          panelName: "Other",
                          paddingBottom: 12,
                          items: [
                            CustomSettingsTile(
                              title: "Disclaimer",
                              trailing: CustomButton(
                                backgroundColor: Colors.transparent,
                                // padding: const EdgeInsets.all(10),
                                buttonContent: Icon(
                                  Iconsax.warning_2,
                                  size: 24,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                ),
                              ),
                              onTap: () {
                                disclaimerDialog(context);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomSettingsTile(
                              title: "Log Out",
                              trailing: CustomButton(
                                backgroundColor: Colors.transparent,
                                // padding: const EdgeInsets.all(10),
                                buttonContent: Icon(
                                  Iconsax.logout,
                                  size: 24,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                ),
                              ),
                              onTap: () {
                                final provider = Provider.of<MyAppProvider>(
                                    context,
                                    listen: false);
                                provider.logOut();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SplashScreen()));
                              },
                            )
                          ]),
                      // const SizedBox(
                      //   height: 6,
                      // ),
                      Container(
                        height: 1,
                        margin: const EdgeInsets.only(bottom: 24),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).textTheme.labelMedium!.color),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.4,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(
                                Dimensions.smallCornerRadius)),
                        alignment: Alignment.topLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomButton(
                                      backgroundColor:
                                          Theme.of(context).indicatorColor,
                                      borderRadius:
                                          Dimensions.smallCornerRadius,
                                      margin: const EdgeInsets.only(bottom: 16),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 20),
                                      buttonContent: CustomText(
                                        textName: "Information",
                                        fontWeight: FontWeight.w700,
                                        textColor: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      )),
                                  CustomButton(
                                    backgroundColor: Colors.transparent,
                                    borderRadius: Dimensions.smallCornerRadius,
                                    margin: const EdgeInsets.only(bottom: 16),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 20),
                                    buttonContent: CustomText(
                                      textName: "V 1.0.0",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      softWrap: true,
                                      textColor: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.color,
                                    ),
                                  )
                                ],
                              ),
                              CustomText(
                                maxLines: 2,
                                fontWeight: FontWeight.w600,
                                textName:
                                    "Made with love from india 🇮🇳 by Sarthak Patil..",
                                fontSize: 12,
                                letterSpacing: 1,
                                softWrap: true,
                                textColor: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color,
                              )
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void disclaimerDialog(BuildContext context) {
    var dialog = AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: CustomText(
        textName: "Disclaimer",
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
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
                fontWeight: FontWeight.w500,
                maxLines: 10,
                lineHeight: 1.6,
                textColor: Theme.of(context).textTheme.labelMedium!.color,
                textName:
                    "Widgets Are For Personal Use Only. For Commercial Give Us Proper Credit. Sharing Of This Widgets Not Allowed"),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Theme.of(context).textTheme.titleMedium!.color,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                      child: CustomText(
                        textName: "OK",
                        textColor:
                            Theme.of(context).textTheme.titleLarge!.color,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
