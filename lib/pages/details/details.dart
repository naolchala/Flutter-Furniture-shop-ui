import 'package:flutter/material.dart';
import 'package:furnitureapp/models/product.dart';
import 'package:furnitureapp/util/constants.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kGray,
        foregroundColor: Colors.black,
        title: const Text('Back'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_sharp))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: kGray,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(kPadding * 3),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'tag-${product.id}',
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            height: 300,
                            width: 300,
                            // ignore: prefer_const_constructors
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(300)),
                          ),
                          Image(
                            image: AssetImage('assets/${product.url}'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kPadding * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimary,
                              fontSize: 18),
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        Text(
                          """Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntu""",
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(
              padding: const EdgeInsets.all(kPadding * 2),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: kPadding * 0.5, horizontal: kPadding),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.message_rounded),
                          Padding(padding: EdgeInsets.all(4)),
                          Text(
                            "Chat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.shopping_bag_outlined),
                          Padding(padding: EdgeInsets.all(4)),
                          Text("Add to Cart")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
