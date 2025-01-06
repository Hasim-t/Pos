import 'package:flutter/material.dart';
import 'package:posdelivery/service/login_service.dart';
import 'package:posdelivery/widgets/custom_textfromfiled.dart';
import 'package:posdelivery/widgets/custom_textwidget.dart';
import 'package:posdelivery/widgets/leaniercolor_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;

    return LeaniercolorWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHight * 0.01,
                  ),
                  Row(
                 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/LogoPos1.png',
                        height: 50,
                        width: 50,
                      ),
                      const CustomTextwidget(
                        text: 'Benchmark',
                        size: 30,
                      ),
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                      const CustomTextwidget(
                        text: 'POS',
                        size: 40,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHight * 0.09,
                  ),
                  const CustomTextwidget(
                    text: 'Delivery Staff Login',
                    size: 28,
                  ),
                  SizedBox(
                    height: screenHight * 0.01,
                  ),
                  const CustomTextwidget(
                    text: 'Access delivery schedules and ',
                    size: 20,
                  ),
                  const CustomTextwidget(
                    text: 'Update order Status ',
                    size: 20,
                  ),
                  SizedBox(
                    height: screenHight * 0.1,
                  ),
                  const CustomTextwidget(
                    text: 'Enter your username and password',
                    size: 18,
                    color: Colors.white70,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfromfiled(
                    isObscure: false,
                    controller: emailController,
                    hintText: 'Email',
                    screenwidth: screenwidth,
                    prefixicon: const Icon(Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                          .hasMatch(value)) {
                        return "Enter a valid email address";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextfromfiled(
                    isObscure: true,
                    controller: passController,
                    hintText: 'password',
                    screenwidth: screenwidth,
                    prefixicon: const Icon(Icons.lock),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                     submitmail(emailController, passController);
                      }
                         
                        
                    },
                    child: Container(
                      height: 60,
                      width: screenwidth * 0.85,
                      decoration: BoxDecoration(
                        color: const Color(0XFF029CFE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: CustomTextwidget(
                          text: "Login",
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot your password?",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
