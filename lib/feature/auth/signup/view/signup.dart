import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/custom_widgets/custom_elevatedbutton.dart';
import '../../../../core/custom_widgets/custom_text.dart';
import '../../../../core/custom_widgets/custom_textformfield.dart';
import '../../../bottomnavigationbar/bottomnavigationbar.dart';
import '../../login/view/login_screen.dart';
import '../model/model.dart';
import '../provider/signup_provider.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  void _onTapIsPasswordVisible() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<SignupProvider>(
          builder: (context, signupProvider, child) {
            return Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create an Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 25),
                  CustomTextformfield(
                    controller: _nameController,
                    labelText: 'Enter Username',
                    validator: (val) {
                      return signupProvider.username(val!);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextformfield(
                    controller: _emailController,
                    labelText: 'Enter Email',
                    validator: (val) {
                      return signupProvider.emailvalidation(val!);
                    },
                  ),
                  const SizedBox(height: 10),

                  CustomTextformfield(
                    obscureText: _isPasswordVisible,
                    controller: _paswordController,
                    labelText: 'Enter Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _onTapIsPasswordVisible,
                    ),
                    validator: (val) {
                      return signupProvider.passwordValidation(val!);
                    },
                  ),

                  const SizedBox(height: 10),

                  CustomElevatedbutton(
                    text: 'Create',
                    color: Colors.white,
                    width: double.infinity,
                    height: 50,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        final userId = DateTime.now().millisecondsSinceEpoch
                            .toString();
                        UserModel userDetials = UserModel(
                          userId: userId,
                          name: _nameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _paswordController.text.trim(),
                        );
                        signupProvider.createAccount(userDetials);
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (ctx) => MainScreen()),
                      );
                    },
                    backgroundColor: const Color(0xff4F7B39),
                    borderRadius: 7,
                    fontsize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Already Have an Account? ",
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => LoginPage()),
                          );
                        },
                        child: const CustomText(
                          text: "Login",
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
