import 'package:e_commerce_app_demo/feature/auth/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom_widgets/custom_appbar.dart';
import '../../core/custom_widgets/custom_elevatedbutton.dart';
import '../../utils/custom_widgets/custom_textformfield.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProfileSettings extends StatelessWidget {
  ProfileSettings({super.key});
  final TextEditingController firstname = TextEditingController();
  final TextEditingController secondname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppbar(
          title: Text(
            "My Order",
            style: GoogleFonts.poppins(
              color: Color(0xff4F7B39),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          CustomTextformfield(
            controller: firstname,
            labelText: 'Name',
            validator: (val) {
              // return controller.username(val);
            },
          ),

          SizedBox(height: 30),
          CustomTextformfield(
            controller: email,
            labelText: 'Email',
            validator: (val) {
              //    return controller.emailvalidation(val);
            },
          ),
          SizedBox(height: 10),
          CustomElevatedbutton(
            text: 'Update',
            color: Colors.white,
            width: double.infinity,
            height: 45,
            onPressed: () {
              // signup.login().then((value) {
              //   if (value) {
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //         builder: (ctx) => BottomNavigationBarScreen(),
              //       ),
              //     );
              //   } else {
              //     print('invalid data');
              //   }
              // });
            },
            backgroundColor: const Color(0xff4F7B39),
            borderRadius: 10,
            fontsize: 20,
            fontWeight: FontWeight.w500,
          ),
          CustomElevatedbutton(
            text: 'Logout',
            color: Colors.white,
            width: double.infinity,
            height: 45,
            onPressed: () {
              // signup.login().then((value) {
              //   if (value) {
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //         builder: (ctx) => LoginPage(),
              //       ),
              //     );
              //   } else {
              //     print('invalid data');
              //   }
              // });
            },
            backgroundColor: const Color(0xff4F7B39),
            borderRadius: 10,
            fontsize: 20,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
