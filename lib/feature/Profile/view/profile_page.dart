import 'package:e_commerce_app_demo/core/local_db.dart/shared_pref.dart';
import 'package:e_commerce_app_demo/core/utils/colors.dart';
import 'package:e_commerce_app_demo/feature/Profile/provider/profile_provider.dart';
import 'package:e_commerce_app_demo/feature/auth/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/custom_widgets/custom_appbar.dart';
import '../../../core/custom_widgets/custom_elevatedbutton.dart';
import '../../../core/custom_widgets/custom_textformfield.dart';
import '../../cart/provider/cart_provider.dart';
import '../../order/provider/order_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileProvider>().userDetails();
    });
    super.initState();
  }

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
      body: Consumer<ProfileProvider>(
        builder: (ctx, profileModel, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 12,
              children: [
                CustomTextformfield(
                  controller: profileModel.emailController,
                  labelText: 'Email',
                  onChanged: (val) {
                    profileModel.updateEmail(val);
                  },
                ),

                CustomTextformfield(
                  controller: profileModel.nameController,
                  labelText: 'Fullname',
                  onChanged: (val) {
                    profileModel.updateName(val);
                  },
                ),
                SizedBox(height: 10),
                CustomElevatedbutton(
                  text: 'Update',
                  color: Colors.white,
                  width: double.infinity,
                  height: 45,
                  onPressed: () {
                    profileModel.updateUserDetails(
                      profileModel.updatedEmail,
                      profileModel.updatedName,
                    );
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
                  onPressed: () async {
                    SharedPref.removeUserLoginStatus();
                    context.read<CartProvider>().clearCart();
                    context.read<OrderProvider>().clearOrder();

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (r) => false,
                    );
                  },
                  backgroundColor: AppColors.buttonColor,
                  borderRadius: 10,
                  fontsize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
