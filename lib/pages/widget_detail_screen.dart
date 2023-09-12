// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
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
          children: [
            CustomText(
              textName: title.capitalizeFirstOfEach,
              fontSize: 24,
              softWrap: true,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w600,
              textColor: Theme.of(context).textTheme.labelLarge!.color,
            ),
            const SizedBox(
              width: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: CustomText(
                textName: content?.capitalizeFirstOfEach ?? "unavailable",
                softWrap: true,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                textColor: Theme.of(context).textTheme.labelLarge!.color,
                textOverflow: TextOverflow.ellipsis,
                maxLines: 2,
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
            Theme.of(context).backgroundColor,
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
                    fontSize: 24,
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
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    textColor: Theme.of(context).textTheme.labelLarge!.color,
                    maxLines: 50,
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
