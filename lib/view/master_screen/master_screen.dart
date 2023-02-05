import 'package:bus_project/view/master_screen/bus_section/bus_details_page.dart';
import 'package:bus_project/view/master_screen/widgets/app_bar_section.dart';
import 'package:bus_project/view/master_screen/widgets/bus_card.dart';
import 'package:bus_project/view/master_screen/widgets/top_section.dart';
import 'package:flutter/material.dart';

class MasterScreen extends StatelessWidget {
  MasterScreen({super.key});
  final List<Map<String, dynamic>> busList = [
    {"id": 1, "name": "KSRTC", "seat_count": 20, "type": "2*2"},
    {"id": 2, "name": "Volvo", "seat_count": 16, "type": "1*3"},
    {"id": 3, "name": "IRST", "seat_count": 32, "type": "2*2"},
    {"id": 4, "name": "Sana", "seat_count": 40, "type": "1*3"},
  ];
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
                Text(
                  "${busList.length} Buses Found",
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xff6B6B6B)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: busList.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: size.height * .016,
                );
              },
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final data = busList[index];
                return CommonCard(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BusDetailsPage(
                              type: data['type'],
                              busName: data["name"],
                              seatCount: data["seat_count"],
                            )));
                  },
                  cardType: "bus",
                  title: data['name'],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
