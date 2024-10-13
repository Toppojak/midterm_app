import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'beverage_details_page.dart';
import 'models/beverage.dart';
import 'beverage_provider.dart'; // Import the BeverageProvider

class BeveragesPage extends StatelessWidget {
  final List<Beverage> coffeeMenus = [
    Beverage('Americano', 'assets/images/Americano.png'),
    Beverage('Latte', 'assets/images/Latte.png'),
    Beverage('Caramel Macchiato', 'assets/images/Caramel Macchiato.png')
  ];

  final List<Beverage> teaMenus = [
    Beverage('Matcha Latte', 'assets/images/Matcha Latte.png'),
    Beverage('Lemon Tea', 'assets/images/Lemon Tea.png'),
    Beverage('Homsuwan Pineapple Black Tea',
        'assets/images/Homsuwan Pineapple Black Tea.png')
  ];

  final List<Beverage> seasonalMenus = [
    Beverage('Red Apple Frozen Tea', 'assets/images/Red Apple Frozen Tea.png'),
    Beverage('Nostalgic', 'assets/images/Nostalgic.png'),
    Beverage('Sunset', 'assets/images/Sunset.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Beverages'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: const Color.fromARGB(255, 235, 239, 241),
        child: ListView(
          children: [
            _buildExpansionTile(context, 'Coffee', coffeeMenus, 'Coffee'),
            _buildExpansionTile(context, 'Tea', teaMenus, 'Tea'),
            _buildExpansionTile(
                context, 'Seasonal Drinks', seasonalMenus, 'Seasonal Drinks'),
          ],
        ),
      ),
    );
  }

  // Helper function to build ExpansionTile for each category
  Widget _buildExpansionTile(BuildContext context, String title,
      List<Beverage> menus, String category) {
    return ExpansionTile(
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      children: menus.map((menu) {
        return ListTile(
          leading: Image.asset(menu.imageUrl,
              width: 50, height: 50, fit: BoxFit.cover),
          title: Text(menu.name),
          onTap: () {
            // เรียกใช้ selectBeverage โดยส่ง menu.name และ category
            context
                .read<BeverageProvider>()
                .selectBeverage(menu.name, category);

            context
                .read<BeverageProvider>()
                .resetSelections(); // Reset selections

            // Navigate to the details page for the selected beverage
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BeverageDetailsPage(
                  menuName: menu.name,
                  category: category,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
