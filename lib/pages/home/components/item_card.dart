import 'package:flutter/material.dart';
import 'package:furnitureapp/models/product.dart';
import 'package:furnitureapp/pages/details/details.dart';
import 'package:furnitureapp/util/constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.cardWidth, required this.product})
      : super(key: key);

  final double cardWidth;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(
                      product: product,
                    )));
      },
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: kPadding),
        clipBehavior: Clip.none,
        margin: const EdgeInsets.symmetric(vertical: kPadding),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 5),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            SizedBox(
              width: cardWidth * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(kPadding),
                      child: Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 20, color: Colors.blue.shade900),
                      ),
                    ),
                  ),
                  Container(
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: kPadding * 0.4, horizontal: kPadding * 1.5),
                    child: Text(
                      "\$${product.price}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              child: Hero(
                tag: 'tag-${product.id}',
                child: SizedBox(
                  width: cardWidth * 0.4,
                  child: Center(
                    child: Image(
                      image: AssetImage("assets/${product.url}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
