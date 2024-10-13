import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'books_page.dart';
import 'beverages_page.dart';
import 'BlankPage.dart';
import 'beverage_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BeverageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/books': (context) => BooksPage(),
        '/beverages': (context) => BeveragesPage(),
        '/floorplan': (context) => Blankpage(),
        '/events': (context) => Blankpage(),
        '/branches': (context) => Blankpage(),
        '/marketplace': (context) => Blankpage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TG Coworking Space'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0), // Adjust the padding
              child: Image.asset('assets/images/Coworking.png',
                  height: 300, fit: BoxFit.cover), // Adjust the height
            ),
            _buildMenuButton(context, 'Booking Books',
                'Reserve your favorite books.', Icons.book, '/books'),
            _buildMenuButton(
                context,
                'Order Beverages',
                'Choose from a variety of beverages.',
                Icons.local_cafe,
                '/beverages'),
            _buildMenuButton(context, 'See Floor Plan', 'Find your best spot',
                Icons.table_bar, '/floorplan'),
            _buildMenuButton(context, 'See Events', 'All events located here',
                Icons.event, '/events'),
            _buildMenuButton(context, 'Branches', 'Find out spaces near you',
                Icons.star, '/branches'),
            _buildMenuButton(context, 'Marketplace', 'Buy things you like',
                Icons.shop, '/marketplace'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, String subtitle,
      IconData icon, String routeName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40.0,
                color: Colors.blue,
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(subtitle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
