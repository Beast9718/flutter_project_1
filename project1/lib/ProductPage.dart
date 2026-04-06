import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(118, 235, 93, 183),
                  Color.fromARGB(171, 255, 251, 252),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(0),
                        child: Image(
                          image: AssetImage("assets/images/shirts.webp"),

                          colorBlendMode: BlendMode.dstIn,
                          color: Color.fromARGB(226, 0, 0, 0),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Header(),
                    ],
                  ),
                  SizedBox(height: 10),
                  DescriptionCard(),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 30,

            left: 30,
            right: 30,
            height: 60,

            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(227, 40, 38, 38),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Badge(
                      isLabelVisible: true,
                      label: Text('3'),
                      child: Icon(
                        Icons.home,
                        size: 35,
                        color: const Color.fromARGB(173, 255, 255, 255),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(227, 40, 38, 38),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Badge(
                      isLabelVisible: true,
                      label: Text('3'),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 35,
                        color: const Color.fromARGB(173, 255, 255, 255),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(227, 40, 38, 38),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Badge(
                      isLabelVisible: true,
                      label: Text('3'),
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: const Color.fromARGB(173, 255, 255, 255),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget Header() {
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: Icon(Icons.arrow_back, size: 30),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(213, 255, 255, 255),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(96, 213, 208, 208),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: Badge(child: Icon(Icons.upload_outlined, size: 30)),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(96, 213, 208, 208),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: Badge(
                  child: Icon(Icons.favorite_border_outlined, size: 30),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget DescriptionCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 80, blurStyle: BlurStyle.normal)],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 222, 117, 241),
            const Color.fromARGB(255, 242, 227, 245),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Oversized Hoodie',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          
                  Text(
                    '\$69.00',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(205, 255, 255, 255)
                ),
                child: Row(
                  children: [
                    Icon(Icons.star_border_outlined),
                    SizedBox(width: 5),
                    Text(
                      '4.4',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(thickness: 3,
          color: const Color.fromARGB(255, 255, 227, 253),
          radius: BorderRadius.circular(20),)
        ],
      ),
    ),
  );
}
