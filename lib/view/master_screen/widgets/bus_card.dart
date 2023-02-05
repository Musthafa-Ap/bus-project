import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final String cardType;
  const CommonCard({super.key, required this.cardType});

  @override
  Widget build(BuildContext context) {
    String image = "assets/images/bus2.png";
    String buttonTitle = "Manage";
    switch (cardType) {
      case 'bus':
        image = "assets/images/bus2.png";
        buttonTitle = "Manage";
        break;
      case 'driver':
        image = "assets/images/woman.png";
        buttonTitle = "Delete";
        break;
    }

    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * .0911,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              width: size.width * .210,
              decoration: BoxDecoration(
                  color: const Color(0xffC1C1C1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  image: DecorationImage(image: AssetImage(image))),
            ),
            SizedBox(
              width: size.width * .0386,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "KSRTC",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff474747)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Swift Scania P-series",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff474747)),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * .0369,
              width: size.width * .186,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xffFC153B),
              ),
              child: Center(
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
