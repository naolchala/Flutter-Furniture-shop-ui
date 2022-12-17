import 'package:flutter/material.dart';
import 'package:furnitureapp/models/product.dart';
import 'package:furnitureapp/pages/home/components/item_card.dart';
import 'package:furnitureapp/util/constants.dart';

import 'components/filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width - kPadding * 2;
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_active), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [
                searchInput(),
                const Filters(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: kPadding),
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.symmetric(horizontal: kPadding),
                    margin: const EdgeInsets.only(top: kPadding * 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kPadding),
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCard(
                          cardWidth: cardWidth,
                          product: products[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container searchInput() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 0.5, vertical: kPadding * 0.2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
