import 'package:bus_project/provider/driver_provider.dart';
import 'package:bus_project/view/home_page/common_widgets/common_app_bar.dart';
import 'package:bus_project/view/home_page/common_widgets/common_button.dart';
import 'package:bus_project/view/home_page/common_widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AddDriverPage extends StatelessWidget {
  AddDriverPage({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: ListView(
        children: [
          const CommonAppBar(title: "Add Driver"),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CommonTextField(
                    controller: _nameController,
                    hintText: "Enter Name",
                    validator: (value) =>
                        value!.isEmpty ? "This field is required" : null,
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  CommonTextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.number,
                    controller: _mobileController,
                    hintText: "Enter Mobile Number",
                    validator: (value) =>
                        value!.isEmpty ? "This field is required" : null,
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  CommonTextField(
                    controller: _licenseController,
                    hintText: "Enter License Number",
                    validator: (value) =>
                        value!.isEmpty ? "This field is required" : null,
                  ),
                  SizedBox(
                    height: size.height * .43,
                  ),
                  Consumer<DriverProvider>(
                    builder: (context, provider, child) {
                      return provider.isCreatingLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CommonButton(
                              title: "Save",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  provider.addDriver(
                                      number: _nameController.text,
                                      license: _licenseController.text,
                                      name: _nameController.text,
                                      context: context);
                                }
                              });
                    },
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
