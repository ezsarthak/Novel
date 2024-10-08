// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../components/novel_button.dart';
import '../components/novel_text.dart';
import '../models/widget_info_model.dart';
import '../utils/extensions.dart';
import 'package:provider/provider.dart';
import '../constants/dimensions.dart';
import '../utils/novel_provider.dart';

class WidgetDetails extends StatelessWidget {
  final String imagepath;
  final AsyncSnapshot<List<WidgetInfo>> snapshot;

  const WidgetDetails(
      {super.key, required this.snapshot, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    final providerChange = Provider.of<MyAppProvider>(context);
    Widget infoTile(String title, String? content) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomText(
                textName: title.capitalizeFirstOfEach,
                fontSize: 20,
                softWrap: true,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w600,
                textColor: Theme.of(context).textTheme.labelLarge!.color,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomText(
                  textName: content?.capitalizeFirstOfEach ?? "unavailable",
                  softWrap: true,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textColor: Theme.of(context).textTheme.labelLarge!.color,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 1000,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight,
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: Dimensions.pagePadding,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textName:
                        snapshot.data!.elementAt(0).title ?? "unavailable",
                    fontSize: Dimensions.appBarTitle,
                    textColor: Theme.of(context).textTheme.labelLarge!.color,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    textName:
                        "Desingned By ${snapshot.data?.elementAt(0).author}" ??
                            "unavailable",
                    textOverflow: TextOverflow.ellipsis,
                    softWrap: true,
                    fontWeight: FontWeight.w200,
                    fontSize: Dimensions.appBarSubTitle,
                    textColor: Theme.of(context).textTheme.labelLarge!.color,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: providerChange.bg == true
                            ? Colors.grey.shade500
                            : Colors.black,
                        borderRadius: BorderRadius.circular(
                            Dimensions.smallCornerRadius)),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: FileImage(File(imagepath))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  infoTile("Name:", snapshot.data!.elementAt(0).title),
                  infoTile("Author:", snapshot.data!.elementAt(0).author),
                  infoTile("Version:",
                      snapshot.data!.elementAt(0).version.toString()),
                  CustomText(
                    textName: "Description:",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textColor: Theme.of(context).textTheme.labelLarge!.color,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    textName: snapshot.data!.elementAt(0).description ??
                        "unavailable",
                    softWrap: true,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textColor: Theme.of(context).textTheme.labelLarge!.color,
                    maxLines: 10000,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CustomButton(
                      onPressed: () async {
                        await LaunchApp.openApp(
                          androidPackageName: 'org.kustom.widget',
                          openStore: true,
                        );
                      },
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.16,
                          vertical: MediaQuery.of(context).size.width * 0.04),
                      backgroundColor: Theme.of(context).indicatorColor,
                      // padding: const EdgeInsets.all(10),
                      buttonContent: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Iconsax.brush_45,
                            size: 28,
                            color: Theme.of(context).textTheme.titleLarge!.color,
                          ),
                          CustomText(
                            textName: "Apply",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            textColor: Theme.of(context).textTheme.titleLarge!.color,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
