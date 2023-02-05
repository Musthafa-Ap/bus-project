import 'dart:math';

import 'package:bus_project/provider/login_provider.dart';
import 'package:bus_project/view/home_page/common_widgets/common_button.dart';
import 'package:bus_project/view/home_page/common_widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * .327,
                  decoration: const BoxDecoration(
                      color: Color(0xff2B2B2B),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/images/polygon.png",
                          ))),
                ),
                const Positioned(
                  bottom: 72,
                  left: 30,
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 41,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Positioned(
                  bottom: 52,
                  left: 30,
                  child: Text(
                    "Manage your Bus and Drivers",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _fromKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .0517,
                    ),
                    CommonTextField(
                      controller: _usernameController,
                      hintText: "Enter Username",
                      validator: (value) =>
                          value!.isEmpty ? "This field is required" : null,
                    ),
                    SizedBox(
                      height: size.height * .0209,
                    ),
                    CommonTextField(
                      controller: _passwordController,
                      hintText: "Enter Password",
                      isObscure: true,
                      validator: (value) =>
                          value!.isEmpty ? "This field is required" : null,
                    ),
                    SizedBox(
                      height: size.height * .3,
                    ),
                    Consumer<LoginProvider>(
                      builder: (context, provider, child) {
                        return provider.isLoading == true
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CommonButton(
                                title: 'Login',
                                onTap: provider.isLoading == false
                                    ? () {
                                        if (_fromKey.currentState!.validate()) {
                                          provider.NormalLogin(
                                              username:
                                                  _usernameController.text,
                                              password:
                                                  _passwordController.text,
                                              context: context);
                                        }
                                      }
                                    : () {
                                        print("loading");
                                      });
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
