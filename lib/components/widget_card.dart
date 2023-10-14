import 'dart:io';
import 'package:flutter/material.dart';
import '../models/widget_info_model.dart';
import '../pages/widget_detail_screen.dart';
import '../services/load_widget_detail.dart';
import 'package:provider/provider.dart';
import '../utils/novel_provider.dart';

class WidgetCard extends StatefulWidget {
  final String imagepath;
  final String jsonpath;

  const WidgetCard({Key? key, required this.imagepath, required this.jsonpath})
      : super(key: key);

  @override
  State<WidgetCard> createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  late Future<List<WidgetInfo>> widgetobject;

  @override
  void initState() {
    widgetobject = LoadWidgetDetail.getwidgetinfo(widget.jsonpath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerChange = Provider.of<MyAppProvider>(context);
    return FutureBuilder<List<WidgetInfo>>(
      future: widgetobject.whenComplete(
          () => Future.delayed(const Duration(milliseconds: 100))),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => WidgetDetails(
                            snapshot: snapshot,
                            imagepath: widget.imagepath,
                          ))));
            },
            child: Container(
              height: MediaQuery.of(context).size.width - 80,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: providerChange.bg == true
                      ? Colors.grey.shade500
                      : Colors.black,
                  borderRadius: BorderRadius.circular(24)),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: FileImage(File(widget.imagepath))),
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
