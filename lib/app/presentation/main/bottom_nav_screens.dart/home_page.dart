import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/models/product_model.dart';
import 'package:flutter_ecommerce/app/state/product/add_product.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/product_card.dart';
import '../../../models/banner_model.dart';
import '../../../state/product/banners/banner_controller.dart';

class HomePageMain extends StatelessWidget {
  const HomePageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProductController>(
            init: ProductController(),
            initState: (controller) => controller,
            builder: (controller) {
              return Column(
                children: [
                  FutureBuilder<List<BannerModel>>(
                      future: bannerController.getBanner(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height / 3.8,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.9,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: snapshot.data!.map((banner) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  child: Image.network(
                                    banner.image,
                                    height: 150,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        );
                      }),
                  const SizedBox(height: 35),
                  FutureBuilder<List<ProductModel>>(
                      future: controller.getProducts(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              child: Text(
                                'Latest Products',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    final product = snapshot.data![index];
                                    final images = product.images;
                                    return ProductCard(
                                      images: images,
                                      product: product,
                                      onTap: () {},
                                    );
                                  }),
                            ),
                          ],
                        );
                      }),
                  const SizedBox(height: 35),
                  FutureBuilder<List<ProductModel>>(
                      future: controller.getProducts(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              child: Text(
                                'Latest Products',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    final product = snapshot.data![index];
                                    final images = product.images;
                                    return ProductCard(
                                      images: images,
                                      product: product,
                                      onTap: () {},
                                    );
                                  }),
                            ),
                          ],
                        );
                      }),
                  const SizedBox(height: 35),
                  FutureBuilder<List<BannerModel>>(
                      future: bannerController.getBanner(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return Stack(
                          children: [
                            Image.network(
                              snapshot.data![1].image,
                              height: 150,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Positioned(
                              top: 70,
                              left: 50,
                              right: 0,
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    snapshot.data![1].title,
                                    style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  const SizedBox(height: 35),
                ],
              );
            }),
      ),
    );
  }
}
