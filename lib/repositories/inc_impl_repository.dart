import 'package:app_state_mamagment/config/data.dart';
import 'package:app_state_mamagment/repositories/abstracts/inc_respository.dart';
import 'package:app_state_mamagment/repositories/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IncImplRespository extends IncRepository {
  final FirebaseFirestore? firestore;
  late DocumentReference _incrementRef;

  IncImplRespository({
    required this.firestore,
  }) {
    _incrementRef = firestore!.collection("beta").doc("increment");
  }

  int _inc = 0;

  @override
  Future<int> get inc async {
    DocumentSnapshot doc = await _incrementRef.get();

    // dynamic data = doc.data();

    // print(data!["test"]);

    _inc = doc.get("inc");

    return _inc;
  }

  @override
  Future increment() async {
    // DocumentSnapshot doc = await _incrementRef.get();

    // int inc = doc.get("inc");

    _inc++;

    await _incrementRef.update({
      "inc": _inc,
    });

    // await firestore.collection("beta").add({"email": "john@doamint.ltd"});
  }

  List<ProductModel> getProduct() {
    return kData.map((e) => ProductModel(title: e["title"]!)).toList();
  }
}
