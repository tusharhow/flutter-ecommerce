import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/text_form_field.dart';
import '../../state/product/add_product.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController brandController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController discountController = TextEditingController();
    final TextEditingController discountPriceController =
        TextEditingController();
    final TextEditingController discountStartDateController =
        TextEditingController();
    final TextEditingController discountEndDateController =
        TextEditingController();
    final productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<ProductController>(
              init: productController,
              builder: (controller) {
                return Column(
                  children: [
                    FormFieldComponent(
                      hintText: 'Enter Name',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                      hintText: 'Enter Price',
                      controller: priceController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                      hintText: 'Enter Description',
                      controller: descriptionController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                      hintText: 'Enter Category',
                      controller: categoryController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    controller.singleImage.value != null
                        ? Row(
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Selected Image',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Image.file(
                                    File(controller.singleImage.value!.path),
                                    height: 100,
                                  ),
                                ],
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              controller.pickImage(
                                ImageSource.gallery,
                              );
                            },
                            child: const Text('Add Image'),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                      hintText: 'Enter Brand',
                      controller: brandController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                      hintText: 'Enter Quantity',
                      controller: quantityController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.imageList != null
                        ? Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Selected Images',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: controller.imageList == 0 ? 100 : 180,
                                width: MediaQuery.of(context).size.width,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.imageList!.length + 1,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5,
                                  ),
                                  itemBuilder: (context, index) {
                                    return index == 0
                                        ? SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                controller.selectImages();
                                              },
                                              child: const Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Stack(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Image.file(
                                                  File(controller
                                                      .imageList![index - 1]
                                                      .path),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                top: 10,
                                                right: 40,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .deleteImage(index - 1);
                                                  },
                                                  child: const Icon(
                                                    Icons.cancel,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                  },
                                ),
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              controller.selectImages();
                            },
                            child: const Text('Add More Image'),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                      hintText: 'Enter Discount',
                      controller: discountController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                      hintText: 'Enter Discount Price',
                      controller: discountPriceController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                      hintText: 'Enter Discount Start Date',
                      controller: discountStartDateController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                      hintText: 'Enter Discount End Date',
                      controller: discountEndDateController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // productController.addProduct(
                        //   nameController.text,
                        //   priceController.text,
                        //   descriptionController.text,
                        //   File(controller.singleImage.value!.path),
                        //   controller.imageList!,
                        //   quantityController.text,
                        //   discountController.text,
                        //   discountPriceController.text,
                        //   discountStartDateController.text,
                        //   discountEndDateController.text,
                        //   "FFF",
                        //   "THRTH",
                        //   "FFFWGH",
                        //   "HWEHH",
                        // );
                        controller.uploadMultipleImages();
                      },
                      child: Text('Add Product'),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
