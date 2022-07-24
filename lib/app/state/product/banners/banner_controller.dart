import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/app/models/banner_model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final _firebase = FirebaseFirestore.instance;

  var banners = RxList<BannerModel>();
  Future<List<BannerModel>> getBanner() async {
    final snapshot = await _firebase.collection('banners').get();
    banners.clear();
    for (var doc in snapshot.docs) {
      banners.add(BannerModel.fromJson(doc.data()));
      update();
    }

    return banners;
  }

  @override
  void onInit() {
    getBanner();
    super.onInit();
  }
}
