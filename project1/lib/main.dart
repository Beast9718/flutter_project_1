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
              const Color.fromARGB(255, 255, 151, 255),
              const Color.fromARGB(255, 255, 219, 255),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [SizedBox(height: 20), Header()],
            ),
          ),
        ),
      ),
    );
  }
}

Widget Header() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
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
        Container(padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(213, 255, 255, 255)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(96, 213, 208, 208),
                shape: BoxShape.circle,
                border:Border.all(color: Colors.white) ,
              ),
              child: Badge(
                isLabelVisible: true,
                label: Text('3',),
                child: Icon(Icons.shopping_bag_outlined,size: 30,),
              ),
          
            ),
            SizedBox(width: 10,),
            Container(padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color:const Color.fromARGB(96, 213, 208, 208),
                shape: BoxShape.circle,
                border:Border.all(color: Colors.white) ,
              ),
              child: Badge(
                isLabelVisible: true,
                label: Text('3',),
                child: Icon(Icons.notifications_outlined,size: 30,),
              ),
          
            ),
          ]),
        ),
      ],
    ),
  );
}
