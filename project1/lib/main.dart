import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/HomePage.dart';
import 'package:project1/ProductPage.dart';
import 'package:project1/ResetPasswordPage.dart';
import 'package:project1/signin_page.dart';
import 'package:project1/signup_page.dart';

void main() {
  runApp(const MyApp());
}
final GoRouter _router=GoRouter(initialLocation:'/signup',routes: [
  GoRoute(path: '/signup',builder: (context, state) => const SignupPage(),),
  GoRoute(path: '/signin',builder: (context, state) => const SigninPage(),),
  GoRoute(path: '/home',builder: (context, state) => const HomePage(),),
  GoRoute(path: '/products',builder: (context, state) => const ProductPage(),),
  GoRoute(path: '/api/v1/auth/password-reset-confirm/:token',builder: (context, state) {
    final String token=state.pathParameters['token']??'';
    return ResetPasswordPage(token: token);
  }),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: _router,);
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(118, 235, 93, 183),
//                   Color.fromARGB(171, 255, 221, 225),
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: SafeArea(
//               child: SingleChildScrollView(
                
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 20),
//                     Header(),
//                     SizedBox(height: 20),
//                     Search(),
//                     SizedBox(height: 20),
//                     Welcome(),
//                     SizedBox(height: 20),
//                     Category(),
//                     SizedBox(height: 20),
//                     ProductCards(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 20,
          
//             left: 100,
//             right: 100,
//             height: 60,
           
//             child: Container(
              
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 0, 0, 0),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(width: 5,),
//                   Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(227, 40, 38, 38),
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.black)
                  
//                 ),
//                 child: Badge(
//                   isLabelVisible: true,
//                   label: Text('3'),
//                   child: Icon(Icons.home, size: 35,color: const Color.fromARGB(173, 255, 255, 255),),
//                 ),
//               ),
//                SizedBox(width: 5,),
//                   Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(227, 40, 38, 38),
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.black)
                  
//                 ),
//                 child: Badge(
//                   isLabelVisible: true,
//                   label: Text('3'),
//                   child: Icon(Icons.shopping_bag_outlined, size: 35,color: const Color.fromARGB(173, 255, 255, 255),),
//                 ),
//               ),
//                SizedBox(width: 5,),
//                   Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(227, 40, 38, 38),
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.black)
                  
//                 ),
//                 child: Badge(
//                   isLabelVisible: true,
//                   label: Text('3'),
//                   child: Icon(Icons.person, size: 35,color: const Color.fromARGB(173, 255, 255, 255),),
//                 ),
//               ),
//               SizedBox(width: 5,)
                  
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget Header() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(4),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: Colors.white,
//                   ),
//                   child: Icon(Icons.maps_home_work_outlined, size: 30),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   'New YOrk',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: const Color.fromARGB(255, 106, 106, 106),
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               'Hello, David',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         Container(
//           padding: EdgeInsets.all(2),
//           decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(100),
//             color: const Color.fromARGB(213, 255, 255, 255),
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(96, 213, 208, 208),
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.white),
//                 ),
//                 child: Badge(
//                   isLabelVisible: true,
//                   label: Text('3'),
//                   child: Icon(Icons.shopping_bag_outlined, size: 30),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Container(
//                 padding: EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(96, 213, 208, 208),
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.white),
//                 ),
//                 child: Badge(
//                   isLabelVisible: true,
//                   label: Text('3'),
//                   child: Icon(Icons.notifications_outlined, size: 30),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget Search() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     child: Container(
//       padding: EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(100),
//       ),
//       child: Expanded(
//         child: TextField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             prefixIcon: Icon(Icons.search),
//             hintText: 'Search',
//             border: InputBorder.none,
//             contentPadding: EdgeInsets.all(10),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget Welcome() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     child: Text(
//       'Welcome to 2026\nFashion Style',
//       style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
//     ),
//   );
// }

// Widget Category() {
//   final categories = [
//     {'name': 'shirts', 'image': 'assets/images/shirts.webp'},
//     {'name': 'shoes', 'image': 'assets/images/shoes.webp'},
//     {'name': 'jeans', 'image': 'assets/images/jeans.webp'},
//     {'name': 'bags', 'image': 'assets/images/bags.webp'},
//     {'name': 'suit salwar', 'image': 'assets/images/suit_salwar.webp'},
//     {'name': 'lehenga', 'image': 'assets/images/lehenga.webp'},
//   ];

//   return SizedBox(
//     height: 100,
//     child: ListView.builder(
//       itemCount: categories.length,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         final category = categories[index];

//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(193, 255, 255, 255),
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: category == categories[index]
//                         ? Colors.pink
//                         : Colors.grey,
//                     width: 2,
//                   ),
//                 ),
//                 child: CircleAvatar(
//                   radius: 30,
//                   backgroundImage: AssetImage(categories[index]['image']!),
//                 ),
//               ),
//               Text(
//                 categories[index]['name']!,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }

// Widget ProductCards() {
//   return Center(
//     child: Column(
//       children: [
//         Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadiusGeometry.circular(30),
//               child: Image(
//                 image: AssetImage("assets/images/shirts.webp"),
//                 height: 250,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               top: 10,
//               right: 10,
//               child: Container(
//                 padding: EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: const Color.fromARGB(214, 255, 255, 255),
//                 ),
//                 child: Icon(Icons.favorite_outline, color: Colors.pinkAccent),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 5),
//         Text(
//           'Oversized Hoodie',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),

//         Text(
//           '\$69.00',
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//   );
// }
