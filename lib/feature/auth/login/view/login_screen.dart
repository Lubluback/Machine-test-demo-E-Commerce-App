import 'package:e_commerce_app_demo/feature/auth/signup/view/signup.dart';
import 'package:e_commerce_app_demo/feature/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/custom_widgets/custom_elevatedbutton.dart';
import '../../../../core/custom_widgets/custom_text.dart';
import '../../../../core/custom_widgets/custom_textformfield.dart';
import '../provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  bool _isPasswordVisible = false;

  TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void _onTapIsPasswordVisible() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Consumer<LoginProvider>(
          builder: (context, signup, child) {
            return Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login to your Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 25),
                  CustomTextformfield(
                    controller: emailController,
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.person),
                    validator: (val) {
                      return signup.email(val);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextformfield(
                    obscureText: _isPasswordVisible,
                    controller: passwordcontroller,
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.no_encryption_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _onTapIsPasswordVisible,
                    ),
                    validator: (val) {
                      return signup.passwordValidation(val);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedbutton(
                    text: 'Login',
                    color: Colors.white,
                    width: double.infinity,
                    height: 45,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (ctx) => MainScreen()),
                      );
                    },
                    backgroundColor: const Color(0xff4F7B39),
                    borderRadius: 10,
                    fontsize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: 'Forgot Password?',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Don't Have an Account? ",
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => Signup()),
                          );
                        },
                        child: const CustomText(
                          text: "Sign Up",
                          color: Color(0xff4F7B39),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
