import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .13,
      decoration: const BoxDecoration(
          color: Color(0xff2B2B2B),
          image: DecorationImage(
              scale: 1.7,
              image: AssetImage(
                "assets/images/logo.png",
              ))),
    );
  }
}
