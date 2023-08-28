// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadWidget {
  static Future<List<String>> getwidgets(BuildContext context) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    List<String> listaAssetsFiltered = [];
    List<String> all = [];

    Future<void> getCurrentWallpaper() async {
      await Permission.storage.request();
    }

    var assetsFile =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(assetsFile);
    await getCurrentWallpaper();

    //Filter .zip
    List<String> listzip =
        manifestMap.keys.where((String key) => key.contains('.zip')).toList();

    for (String zip in listzip) {
      listaAssetsFiltered.add(zip);
    }

    Future<File> getImageFileFromAssets(String path) async {
      final byteData = await rootBundle.load(path);
      final buffer = byteData.buffer;
      Random random = Random();
      int randomNumber = random.nextInt(100000000);
      var filePath =
          '$tempPath/$randomNumber'; // file_01.tmp is dump file, can be anything
      return File(filePath).writeAsBytes(
          buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }

    for (var element in listaAssetsFiltered) {
      File zippedFile = await getImageFileFromAssets(element);
      var bytes = zippedFile.readAsBytesSync();
      var archive = ZipDecoder().decodeBytes(bytes);
      for (var file in archive) {
        var fileName = '$tempPath/$zippedFile/${file.name}';
        if (file.isFile) {
          var outFile = File(fileName);
          // print('File:: ${outFile.path}');
          if (outFile.path.endsWith("thumb.jpg")) {
            all.add(outFile.path);
          }
          if (outFile.path.endsWith("info.json")) {
            all.add(outFile.path);
          }
          outFile = await outFile.create(recursive: true);
          await outFile.writeAsBytes(file.content);
        }
      }
    }
    // print(all);
    return all;
  }
}
