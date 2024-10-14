//midterm_app TG Coworking Space

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'beverage_provider.dart'; // Import BeverageProvider

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<BeverageProvider>(
          builder: (context, beverageProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Display the image if a menuName is selected
                if (beverageProvider.menuName != null)
                  Center(
                    child: Image.asset(
                      'assets/images/${beverageProvider.menuName}.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                SizedBox(height: 20),

                // Display all the selected details inside a Card
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the menu name and category
                        if (beverageProvider.menuName != null)
                          Center(
                            child: Text(
                              'Menu: ${beverageProvider.menuName}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        SizedBox(height: 8),

                        if (beverageProvider.category != null)
                          Center(
                            child: Text(
                              'Category: ${beverageProvider.category}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        Divider(height: 30, color: Colors.grey[300]),

                        // Display Size and Sweetness
                        if (beverageProvider.size != null &&
                            beverageProvider.size!.isNotEmpty)
                          Text('Size: ${beverageProvider.size}',
                              style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),

                        if (beverageProvider.sweetness != null &&
                            beverageProvider.sweetness!.isNotEmpty)
                          Text('Sweetness: ${beverageProvider.sweetness}',
                              style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),

                        // Optionally display Syrup, Condiment, Temperature, Foam Topping
                        if (beverageProvider.syrup != null &&
                            beverageProvider.syrup!.isNotEmpty)
                          Text('Syrup: ${beverageProvider.syrup}',
                              style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),

                        if (beverageProvider.condiment != null &&
                            beverageProvider.condiment!.isNotEmpty)
                          Text('Condiment: ${beverageProvider.condiment}',
                              style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),

                        if (beverageProvider.temperature != null &&
                            beverageProvider.temperature!.isNotEmpty)
                          Text('Temperature: ${beverageProvider.temperature}',
                              style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),

                        if (beverageProvider.foamTopping != null &&
                            beverageProvider.foamTopping!.isNotEmpty)
                          Text('Foam Topping: ${beverageProvider.foamTopping}',
                              style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),

                        // Display Espresso Shots and Quantity
                        if (beverageProvider.espressoShots > 0)
                          Text(
                              'Espresso Shot(s): ${beverageProvider.espressoShots}',
                              style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),

                        Text('Quantity: ${beverageProvider.quantity}',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Back to Home button
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Text('Back to Home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
