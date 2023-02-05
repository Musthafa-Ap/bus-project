import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CommonButton extends StatelessWidget {
  final Color titleColor;
  final String title;
  final Color backgroundColor;
  final void Function() onTap;
  const CommonButton(
      {super.key,
      this.backgroundColor = const Color(0xffFC153B),
      required this.title,
      required this.onTap,
      this.titleColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.all(size.width * .0666),
        child: Container(
          height: size.height * .0714,
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20, color: titleColor),
            ),
          ),
        ),
      ),
    );
  }
}
