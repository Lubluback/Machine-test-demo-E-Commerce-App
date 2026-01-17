// import 'package:flutter/material.dart';

// import 'Cart_page.dart';
// import 'home_page.dart';
// import 'order_page.dart';
// import 'profile_page.dart';

// class BottomNavigationBarScreen extends StatefulWidget {
//   const BottomNavigationBarScreen({super.key});

//   @override
//   State<BottomNavigationBarScreen> createState() =>
//       _BottomNavigationBarScreenState();
// }

// class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
//   int selectedIndex = 0;
//   void currentIndex(index) {
//     selectedIndex = index;
//   }

//   final _pageOptions = [const Home(), CartPage(), OrderPage(), ProfilePage()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           const BottomNavigationBarItem(
//             label: 'Home',
//             icon: Icon(Icons.home, color: Color(0xff4F7B39), size: 35),
//           ),
//           BottomNavigationBarItem(
//             label: 'Cart',
//             icon: GetBuilder<HomeController>(
//               builder: (controller1) {
//                 return Badge.count(
//                   count: controller1.cartlist.length,
//                   child: const Icon(
//                     Icons.shopping_cart_rounded,
//                     color: Color(0xff4F7B39),
//                     size: 35,
//                   ),
//                 );
//               },
//             ),
//           ),
//           const BottomNavigationBarItem(
//             label: 'Order',
//             icon: Icon(Icons.favorite, color: Color(0xff4F7B39), size: 35),
//           ),
//           const BottomNavigationBarItem(
//             label: 'Profile',
//             icon: Icon(Icons.person, color: Color(0xff4F7B39), size: 35),
//           ),
//         ],
//         type: BottomNavigationBarType.fixed,
//         currentIndex: selectedIndex,
//         selectedItemColor: Colors.black,
//         iconSize: 40,
//         onTap: (val) {
//           setState(() {});
//           currentIndex(val);
//         },
//         elevation: 0,
//       ),
//       body: _pageOptions[selectedIndex],
//     );
//   }
// }
