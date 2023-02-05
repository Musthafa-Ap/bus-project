import 'package:bus_project/provider/driver_provider.dart';
import 'package:bus_project/view/home_page/common_widgets/common_app_bar.dart';
import 'package:bus_project/view/home_page/common_widgets/common_button.dart';
import 'package:bus_project/view/master_screen/driver_section/add_driver_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bus_card.dart';

class DriverListingPage extends StatelessWidget {
  const DriverListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: SafeArea(child: CommonAppBar(title: "Driver List")),
      ),
      body: SafeArea(child: Consumer<DriverProvider>(
        builder: (context, provider, child) {
          return provider.isDriverListLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : provider.driverList == null
                  ? const Text(
                      "No Driver Found",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, top: 18),
                          child: Text(
                            "${provider.driverList?.driverList?.length ?? 0} Drivers Found",
                            style: const TextStyle(
                                fontSize: 13, color: Color(0xff6B6B6B)),
                          ),
                        ),
                        Expanded(child: Consumer<DriverProvider>(
                          builder: (context, provider, child) {
                            return ListView.separated(
                              itemCount:
                                  provider.driverList?.driverList?.length ?? 0,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: size.height * .016,
                                );
                              },
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final data =
                                    provider.driverList?.driverList?[index];
                                return CommonCard(
                                  onTap: provider.isDeleting == true
                                      ? () {}
                                      : () {
                                          provider.deleteDriver(
                                              driverId: data!.id.toString(),
                                              context: context);
                                        },
                                  cardType: 'driver',
                                  title: data?.name ?? "Driver Name",
                                  subTitle: data?.licenseNo,
                                );
                              },
                            );
                          },
                        )),
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: CommonButton(
                              title: "Add Driver",
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddDriverPage()));
                              }),
                        )
                      ],
                    );
        },
      )),
    );
  }
}
