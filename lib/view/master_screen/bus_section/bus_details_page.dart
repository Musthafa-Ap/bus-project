import 'package:bus_project/view/home_page/common_widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class BusDetailsPage extends StatelessWidget {
  final String busName;
  final int seatCount;
  final String type;
  final String driver;
  final String license;
  const BusDetailsPage(
      {super.key,
      required this.busName,
      required this.seatCount,
      required this.type,
      required this.driver,
      required this.license});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: SafeArea(child: CommonAppBar(title: busName)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 18),
        child: Column(children: [
          SizedBox(
            height: size.height * .038,
          ),
          Container(
            height: size.height * .142,
            decoration: BoxDecoration(
                color: const Color(0xff2B2B2B),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const SizedBox(
                  width: 22,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      driver,
                      style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "License No : $license",
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
                Expanded(child: Image.asset("assets/images/person.png"))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: const Color(0xffDCDCDC)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: size.height * .06,
                      width: size.height * .075,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/seat2.png"))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            children: List.generate(
                                seatCount ~/ 4,
                                (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child:
                                          Image.asset("assets/images/seat.png"),
                                    ))),
                        if (type == "1*3")
                          const SizedBox(
                            width: 40,
                          ),
                        Column(
                            children: List.generate(
                                seatCount ~/ 4,
                                (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child:
                                          Image.asset("assets/images/seat.png"),
                                    ))),
                        if (type == "2*2")
                          const SizedBox(
                            width: 40,
                          ),
                        Column(
                            children: List.generate(
                                seatCount ~/ 4,
                                (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child:
                                          Image.asset("assets/images/seat.png"),
                                    ))),
                        Column(
                            children: List.generate(
                                seatCount ~/ 4,
                                (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child:
                                          Image.asset("assets/images/seat.png"),
                                    )))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
