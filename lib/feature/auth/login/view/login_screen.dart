import 'package:e_commerce_app_demo/core/utils/snackbar.dart';
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
  final TextEditingController _emailController = TextEditingController();
  bool _isPasswordVisible = false;

  TextEditingController _passwordcontroller = TextEditingController();
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
          builder: (context, loginModel, child) {
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
                    controller: _emailController,
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.person),
                    validator: (val) {
                      return loginModel.email(val);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextformfield(
                    obscureText: _isPasswordVisible,
                    controller: _passwordcontroller,
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
                      return loginModel.passwordValidation(val);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedbutton(
                    text: 'Login',
                    color: Colors.white,
                    width: double.infinity,
                    height: 45,
                    onPressed: () {
                      final result = loginModel.userLogin(
                        _emailController.text.trim(),
                        _passwordcontroller.text.trim(),
                      );
                      if (result == 0) {
                        SnackbarUtil.show(
                          context,
                          message: 'login Successfull',
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (ctx) => MainScreen()),
                          (r) => false,
                        );
                      } else if (result == 1) {
                        SnackbarUtil.show(
                          context,
                          message: 'Invalid password',
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      } else if (result == 2) {
                        SnackbarUtil.show(
                          context,
                          message: 'Invalid Email',
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
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
