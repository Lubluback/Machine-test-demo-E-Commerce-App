// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// import '../../core/custom_widgets/custom_containers.dart';
// import '../../core/custom_widgets/custom_text.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final controller = CarouselSliderController();

//   int selectedindex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //1
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: NestedScrollView(
//             // Changes the way the inner and outer scroll are linked together
//             floatHeaderSlivers: true,
//             // This builds the scrollable content above the body
//             headerSliverBuilder: (context, innerBoxIsScrolled) => [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 title: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Image.asset(
//                           "asset/Logo with name 1.png",
//                           fit: BoxFit.contain,
//                           height: 70,
//                           // width: 100,
//                         ),
//                         IconButton(
//                           icon: const Icon(
//                             Icons.notifications_none,
//                             size: 28,
//                             color: Color(0xff4F7B39),
//                           ),
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 expandedHeight: 100,
//                 floating: true,
//                 snap: true,
//                 forceElevated: innerBoxIsScrolled,
//               ),
//             ],
//             // The content of the scroll view
//             body: GetBuilder<HomeController>(
//               builder: (controller1) {
//                 return CustomScrollView(
//                   slivers: [
//                     SliverList(
//                       delegate: SliverChildBuilderDelegate(
//                         childCount: 1,
//                         (context, index) => Column(
//                           children: [
//                             SizedBox(
//                               height: 50,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 20,
//                                   right: 20,
//                                 ),
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                     hintText: "Search your needs here.....",
//                                     prefixIcon: const Icon(Icons.search),
//                                     border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: Color(0xff4F7B39),
//                                       ),
//                                       borderRadius: BorderRadius.circular(30),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             CarouselSlider(
//                               carouselController: controller,
//                               items: [
//                                 //1st Image of Slider
//                                 Container(
//                                   margin: const EdgeInsets.all(6.0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     image: const DecorationImage(
//                                       image: AssetImage(
//                                         "asset/1st banner 2 1.png",
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),

//                                 //2nd Image of Slider
//                                 Container(
//                                   margin: const EdgeInsets.all(6.0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     image: const DecorationImage(
//                                       image: AssetImage(
//                                         "asset/1st banner 2 1.png",
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),

//                                 //3rd Image of Slider
//                                 Container(
//                                   margin: const EdgeInsets.all(6.0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     image: const DecorationImage(
//                                       image: AssetImage(
//                                         "asset/1st banner 2 1.png",
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ],

//                               //Slider Container properties
//                               options: CarouselOptions(
//                                 onPageChanged: (index, reason) {
//                                   selectedindex = index;
//                                   setState(() {});
//                                 },
//                                 height: 150,
//                                 enlargeCenterPage: true,
//                                 //  autoPlay: true,
//                                 aspectRatio: 1,
//                                 // autoPlayCurve: Curves.fastOutSlowIn,
//                                 enableInfiniteScroll: true,
//                                 //   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                                 viewportFraction: 1,
//                                 scrollDirection: Axis.horizontal,

//                                 ///how much width want to take
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: List.generate(
//                                 3,
//                                 (index) => CircleAvatar(
//                                   backgroundColor: selectedindex == index
//                                       ? const Color(0xff4F7B39)
//                                       : const Color(0xffDDEED4),
//                                   radius: 8,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 CustomText(
//                                   text: "Popular Products",
//                                   color: Color(0xff4F7B39),
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 CustomText(
//                                   text: "View all",
//                                   color: Color(0xff4F7B39),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             GridView.builder(
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                     childAspectRatio: 0.68,
//                                     crossAxisCount: 2,
//                                     crossAxisSpacing: 4.0,
//                                     mainAxisSpacing: 4.0,
//                                   ),
//                               itemCount: controller1.list.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return CustomContainers(
//                                   model: controller1.list[index],
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
