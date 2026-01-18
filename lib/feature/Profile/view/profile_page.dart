import 'package:e_commerce_app_demo/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/custom_widgets/custom_appbar.dart';
import '../../../core/custom_widgets/custom_elevatedbutton.dart';
import '../../../core/custom_widgets/custom_textformfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          title: Center(
            child: Text(
              "My Profile",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 12,
          children: [
            CustomTextformfield(
              controller: firstname,
              labelText: 'Name',
              validator: (val) {
                // return controller.username(val);
              },
            ),

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
              backgroundColor: AppColors.buttonColor,
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
              backgroundColor: AppColors.buttonColor,
              borderRadius: 10,
              fontsize: 20,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
