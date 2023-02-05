import 'package:bus_project/view/home_page/common_widgets/common_app_bar.dart';
import 'package:bus_project/view/home_page/common_widgets/common_button.dart';
import 'package:flutter/material.dart';

import '../widgets/bus_card.dart';

class DriverListingPage extends StatelessWidget {
  const DriverListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonAppBar(title: "Driver List"),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 18),
              child: Text(
                "21 Buses Found",
                style: TextStyle(fontSize: 13, color: Color(0xff6B6B6B)),
              ),
            ),
            Expanded(
                child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: size.height * .016,
                );
              },
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const CommonCard(
                  cardType: 'driver',
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(18),
              child: CommonButton(title: "Add Driver", onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}