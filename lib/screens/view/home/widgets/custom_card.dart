
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  final IconData iconData;
  const CustomCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: color,
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black38,
                ),
              ),
              Text(
                subTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
