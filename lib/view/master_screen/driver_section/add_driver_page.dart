import 'package:bus_project/view/home_page/common_widgets/common_app_bar.dart';
import 'package:bus_project/view/home_page/common_widgets/common_button.dart';
import 'package:bus_project/view/home_page/common_widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddDriverPage extends StatelessWidget {
  const AddDriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const CommonAppBar(title: "Add Driver"),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const CommonTextField(hintText: "Enter Name"),
                SizedBox(
                  height: size.height * .02,
                ),
                const CommonTextField(hintText: "Enter Lisence Number"),
                SizedBox(
                  height: size.height * .58,
                ),
                CommonButton(title: "Save", onTap: () {}),
              ],
            ),
          )
        ],
      )),
    );
  }
}
