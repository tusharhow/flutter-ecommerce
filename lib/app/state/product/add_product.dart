import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce/app/models/product_model.dart';
import 'package:flutter_ecommerce/app/presentation/user/auth/login_screen.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File;
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  final _firebase = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  double val = 0;
  var CollectionReference = FirebaseFirestore.instance.collection('products');
  var ref = firebase_storage.FirebaseStorage.instance.ref();
  final _picker = ImagePicker();

  final singleImage = Rxn<File>();

  Future<void> pickImage(ImageSource source) async {
    var image = await _picker.pickImage(source: source);
    if (image == null) return;

    final tempImg = File(image.path);
    singleImage.value = tempImg;
    update();
  }

  final ImagePicker imagePicker = ImagePicker();
  List<File>? imageList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageList!.addAll(selectedImages.map((image) => File(image.path)));
      // limit to 3 images
      if (imageList!.length > 3) {
        imageList!.removeRange(3, imageList!.length);
      }
      update();
    }
    update();
  }

  // delete image by index
  void deleteImage(int index) {
    imageList?.removeAt(index);
    update();
  }

  Future addProduct(
    String name,
    String price,
    String description,
    File image,
    List<File> images,
    String category,
    String itemAvailble,
    String productDiscount,
    String productDiscountPrice,
    String productDiscountStartDate,
    String productDiscountEndDate,
    String productColor,
    String size,
    String brand,
  ) async {
    final user = _auth.currentUser;
    final uid = user!.uid;
    int i = 1;
    for (var img in imageList!) {
      val = i / imageList!.length;
      update();
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {});
        print(i);
        print(val);
      });
    }

    update();
  }

  Future uploadMultipleImages() async {
    List<String> _images = [];
    for (var img in imageList!) {
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          _images.add(value);
          update();
          print("Imaage Uploaded$_images");
          _firebase.collection('products').add({
            'name': 'name',
            'price': 'price',
            'description': 'description',
            'image': value,
            'images': _images,
            'category': 'category',
            'itemAvailble': 'itemAvailble',
            'productDiscount': 'productDiscount',
            'productDiscountPrice': 'productDiscountPrice',
            'productDiscountStartDate': 'productDiscountStartDate',
            'productDiscountEndDate': 'productDiscountEndDate',
            'productColor': 'productColor',
            'size': 'size',
            'brand': 'brand',
          });
          update();
        });
      });
    }
  }

  // get all products
  var products = RxList<ProductModel>();
  Future<List<ProductModel>> getProducts() async {
    final snapshot = await _firebase.collection('products').get();
    products.clear();
    for (var doc in snapshot.docs) {
      products.add(ProductModel.fromJson(doc.data()));
      update();
    }

    return products;
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
