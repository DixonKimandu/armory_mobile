import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterSearch extends StatelessWidget {
  const FilterSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 4, 141, 151),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/filter.svg',
                width: 20,
                height: 20,
                semanticsLabel: 'filter'
              ),
              const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 4, 141, 151),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width  * .1,
        ),
        Container(
          width: MediaQuery.of(context).size.width  * .6,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 4, 141, 151),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width  * .01,
              ),
              SvgPicture.asset(
                'assets/images/search.svg',
                width: 20,
                height: 20,
                semanticsLabel: 'search'
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width  * .02,
              ),
              const Text(
                'Search Items by Serial Number',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 4, 141, 151),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}