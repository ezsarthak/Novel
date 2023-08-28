import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../components/novel_text.dart';
import '../components/widget_card.dart';
import '../utils/novel_provider.dart';

class WidgetScreen extends StatefulWidget {
  final AsyncSnapshot<List<String>> snapshot;

  const WidgetScreen({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  @override
  Widget build(BuildContext context) {
    final providerChange = Provider.of<MyAppProvider>(context);
    List<String> img = [];
    List<String> json = [];
    widget.snapshot.data!.forEach((element) {
      if (element.endsWith('.jpg')) {
        img.add(element);
      }
      if (element.endsWith('.json')) {
        json.add(element);
        print(json);
      }
    });
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 44,
                    left: 44,
                    top: 28,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textName: "KWGT Widgets",
                        fontSize: 30,
                        textColor:
                            Theme.of(context).textTheme.labelLarge!.color,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            textName: "Featured",
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            textColor:
                                Theme.of(context).textTheme.labelLarge!.color,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (providerChange.axis == 4) {
                                  providerChange.axisCount = 2;
                                  providerChange.mainaxisCount = 3;
                                } else {
                                  providerChange.axisCount = 4;
                                  providerChange.mainaxisCount = 4;
                                }
                              });
                            },
                            child: Icon(
                              Iconsax.candle,
                              size: 32,
                              color: Theme.of(context).indicatorColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 44,
                    left: 44,
                  ),
                  child: StaggeredGridView.countBuilder(
                      itemCount: img.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      addRepaintBoundaries: true,
                      staggeredTileBuilder: (index) => StaggeredTile.count(
                          providerChange.axis,
                          providerChange.mainaxis.toDouble()),
                      crossAxisCount: 4,
                      itemBuilder: (context, index) {
                        return Entry.all(
                          delay: const Duration(milliseconds: 20),
                          child: WidgetCard(
                            imagepath: img.elementAt(index),
                            jsonpath: json.elementAt(index),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
