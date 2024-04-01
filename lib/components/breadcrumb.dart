import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreadCrumb extends StatelessWidget {
  final String link;
  final String title;

  const BreadCrumb({super.key, required this.link, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
              Navigator.of(context).pushReplacementNamed(link);
          },
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/home.svg',
                width: 30,
                height: 30,
                semanticsLabel: 'group',
              ),
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color.fromARGB(255, 4, 141, 151),
                  ),
                ),
              )
            ],
          ),
        ),
        SvgPicture.asset(
          'assets/images/arrow-right.svg',
          width: 30,
          height: 30,
          semanticsLabel: 'group',
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Color.fromARGB(255, 4, 141, 151),
          ),
        )
      ],
    );
  }
}