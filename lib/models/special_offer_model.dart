import 'package:cloud_firestore/cloud_firestore.dart';

class SpecialOfferModel {
  final String name, imagePath;
  final int number;

  SpecialOfferModel({
    required this.name,
    required this.number,
    required this.imagePath,
  });

  factory SpecialOfferModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return SpecialOfferModel(
      name: data?['name'],
      imagePath: data?['imagePath'],
      number: data?['number'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "imagePath": imagePath,
      "number": number,
    };
  }
}

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
