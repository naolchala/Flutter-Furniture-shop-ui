import 'package:flutter/material.dart';
import 'package:furnitureapp/util/constants.dart';

class Filters extends StatefulWidget {
  const Filters({
    Key? key,
  }) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var filters = ['All', "Sofa", "Park Bench", "Armchair"];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kPadding * 1.5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters
              .map(
                (filter) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = filters.indexOf(filter);
                    });
                  },
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      color: filters.indexOf(filter) == selected
                          ? Colors.white.withOpacity(0.3)
                          : Colors.transparent,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: kPadding, vertical: kPadding * 0.4),
                    margin:
                        const EdgeInsets.symmetric(horizontal: kPadding * 0.3),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Text(
                      filter,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
