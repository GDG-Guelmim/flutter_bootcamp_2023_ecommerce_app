import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import '../models/special_offer_model.dart';

class HomeController extends GetxController {
  List<Map<String, String>> categories = [
    {"iconPath": "assets/icons/Flash Icon.svg", "title": "Flash Deal"},
    {"iconPath": "assets/icons/Bill Icon.svg", "title": "Bill"},
    {"iconPath": "assets/icons/Game Icon.svg", "title": "Game"},
    {"iconPath": "assets/icons/Gift Icon.svg", "title": "Daily Gift"},
    {"iconPath": "assets/icons/Discover.svg", "title": "More"},
  ];

  FirebaseFirestore db = FirebaseFirestore.instance;

  void insertCategoriesIntoFirebase() {
    for (var category in categories) {
      db
          .collection("categories")
          .doc()
          .set(category)
          .onError((e, _) => debugPrint("Error writing document: $e"));
    }
    debugPrint("----- Done ------");
  }

  void uploadCategoriesIntoFirebaseStorage() async {
    final storageRef = FirebaseStorage.instance.ref();

    try {
      for (var category in categories) {
        final catRef = storageRef.child("categories/${category["title"]}.svg");
        File file = await getImageFileFromAssets(category["iconPath"]!);
        await catRef.putFile(file);
        String url = await catRef.getDownloadURL();

        category["iconPath"] = url;

        await db
            .collection("categories")
            .doc()
            .set(category)
            .onError((e, _) => debugPrint("Error writing document: $e"));
      }
    } catch (e) {
      debugPrint("error: $e");
    }

    debugPrint("----- Done ------");
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<Map<String, String>> list = [];

  Future<List<Map<String, String>>> getCategories() async {
    list.clear();
    await db.collection("categories").get().then(
      (querySnapshot) {
        debugPrint("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          list.add({
            "iconPath": docSnapshot.data()["iconPath"],
            "title": docSnapshot.data()["title"],
          });
        }
      },
      onError: (e) => debugPrint("Error completing: $e"),
    );
    isLoading = false;
    return list;
  }

  void insertSpecial() {
    List<SpecialOfferModel> specialOffersList = [
      SpecialOfferModel(
        name: "Smartphone",
        imagePath: "assets/images/Image Banner 2.png",
        number: 18,
      ),
      SpecialOfferModel(
        name: "Fashion",
        imagePath: "assets/images/Image Banner 3.png",
        number: 24,
      ),
    ];

    for (var offer in specialOffersList) {
      db
          .collection("offers")
          .withConverter(
            fromFirestore: SpecialOfferModel.fromFirestore,
            toFirestore: (SpecialOfferModel city, options) =>
                city.toFirestore(),
          )
          .doc()
          .set(offer)
          .onError((e, _) => debugPrint("Error writing document: $e"));
    }
    debugPrint("----- Done ------");
  }

  void getOffers() async {
    List<SpecialOfferModel> offers = [];
    await db
        .collection("offers")
        .withConverter(
          fromFirestore: SpecialOfferModel.fromFirestore,
          toFirestore: (SpecialOfferModel city, _) => city.toFirestore(),
        )
        .get()
        .then(
      (querySnapshot) {
        debugPrint("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          offers.add(docSnapshot.data());
        }
      },
      onError: (e) => debugPrint("Error completing: $e"),
    );
  }
}
