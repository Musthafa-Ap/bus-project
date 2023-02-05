import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../driver_section/driver_listing_page.dart';

class TopRowSection extends StatelessWidget {
  const TopRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFC153B)),
                height: size.height * .21,
              ),
              const Positioned(
                left: 18,
                top: 8,
                child: Text(
                  "Bus",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Positioned(
                left: 18,
                top: 40,
                child: Text(
                  "Manage your Bus",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Positioned(
                  bottom: 5,
                  right: 0,
                  child: Image.asset("assets/images/bus.png"))
            ],
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DriverListingPage()));
            },
            child: Stack(
              children: [
                Container(
                  height: size.height * .21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff2B2B2B),
                  ),
                ),
                const Positioned(
                  left: 18,
                  top: 8,
                  child: Text(
                    "Driver",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Positioned(
                  left: 18,
                  top: 40,
                  child: Text(
                    "Manage your Driver",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset("assets/images/person.png"))
              ],
            ),
          ),
        )
      ],
    );
  }
}
