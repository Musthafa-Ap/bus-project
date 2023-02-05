import 'package:bus_project/view/master_screen/widgets/app_bar_section.dart';
import 'package:bus_project/view/master_screen/widgets/bus_card.dart';
import 'package:bus_project/view/master_screen/widgets/top_section.dart';
import 'package:flutter/material.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const AppBarSection(),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopRowSection(),
                SizedBox(height: size.height * 0.027),
                const Text(
                  "21 Buses Found",
                  style: TextStyle(fontSize: 13, color: Color(0xff6B6B6B)),
                ),
              ],
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
                return CommonCard(
                  cardType: "bus",
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
