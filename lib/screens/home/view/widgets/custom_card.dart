import 'package:flutter/material.dart';
import 'package:money_manager/common/style/sizedbox.dart';

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

class CustomCardSmall extends StatelessWidget {
  final String text;
  final IconData iconData;
  final void Function() onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  const CustomCardSmall({
    super.key,
    required this.text,
    required this.iconData,
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            )
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              iconData,
              color: foregroundColor,
            ),
            KSizedBox().width10,
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 10, color: foregroundColor),
            )
          ],
        ),
      ),
    );
  }
}
