import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(118, 235, 93, 183),
              Color.fromARGB(171, 255, 221, 225),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Header(),
                SizedBox(height: 20),
                Search(),
                SizedBox(height: 20),
                Welcome(),
                SizedBox(height: 20),
                Category(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget Header() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.maps_home_work_outlined, size: 30),
                ),
                SizedBox(width: 10),
                Text(
                  'New YOrk',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 106, 106, 106),
                  ),
                ),
              ],
            ),
            Text(
              'Hello, David',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(2),
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
                child: Badge(
                  isLabelVisible: true,
                  label: Text('3'),
                  child: Icon(Icons.shopping_bag_outlined, size: 30),
                ),
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
                  isLabelVisible: true,
                  label: Text('3'),
                  child: Icon(Icons.notifications_outlined, size: 30),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget Search() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Expanded(
        child: TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      ),
    ),
  );
}

Widget Welcome() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Text(
      'Welcome to 2026\nFashion Style',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
    ),
  );
}

Widget Category() {
  final categories = [
    {'name': 'shirts', 'image': 'assets/images/shirts.webp'},
    {'name': 'shoes', 'image': 'assets/images/shoes.webp'},
    {'name': 'jeans', 'image': 'assets/images/jeans.webp'},
    {'name': 'bags', 'image': 'assets/images/bags.webp'},
    {'name': 'suit salwar', 'image': 'assets/images/suit_salwar.webp'},
    {'name': 'lehenga', 'image': 'assets/images/lehenga.webp'},
    
  ];
  
  return SizedBox(
    height: 100,
    child: ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(193, 255, 255, 255),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.pink, width: 2),
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(categories[index]['image']!),
                ),
              ),
              Text(
                categories[index]['name']!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    ),
  );
}
