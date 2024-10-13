import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'beverage_provider.dart'; // Import BeverageProvider
import 'BeverageSummary.dart'; // Import Summary Page

class BeverageDetailsPage extends StatefulWidget {
  final String menuName;
  final String category;

  BeverageDetailsPage({required this.menuName, required this.category});

  @override
  _BeverageDetailsPageState createState() => _BeverageDetailsPageState();
}

class _BeverageDetailsPageState extends State<BeverageDetailsPage> {
  final _formKey = GlobalKey<FormState>(); // Form key to track form state

  String? _selectedSize;
  String? _selectedSweetness;
  String? _selectedSyrup;
  String? _selectedCondiment;
  String? _selectedFoamTopping;
  String? _selectedTemperature;
  int _selectedEspressoShots = 0;
  int _quantity = 1;

  // Method to validate and save the form, and then use Provider to store the data
  void _validateAndSaveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form

      // Update data to BeverageProvider using context.read()
      context.read<BeverageProvider>().setMenuName(widget.menuName);
      context.read<BeverageProvider>().setCategory(widget.category);
      context.read<BeverageProvider>().setSize(_selectedSize!);
      context.read<BeverageProvider>().setSweetness(_selectedSweetness!);
      context.read<BeverageProvider>().setSyrup(_selectedSyrup ?? '');
      context.read<BeverageProvider>().setCondiment(_selectedCondiment ?? '');
      context
          .read<BeverageProvider>()
          .setTemperature(_selectedTemperature ?? '');
      context
          .read<BeverageProvider>()
          .setFoamTopping(_selectedFoamTopping ?? '');
      context.read<BeverageProvider>().setEspressoShots(_selectedEspressoShots);
      context.read<BeverageProvider>().setQuantity(_quantity);

      // Navigate to SummaryPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SummaryPage(), // ไม่ต้องส่งข้อมูลผ่าน constructor
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select all the options.')),
      );
    }
  }

  // Define options based on category
  List<String> _getSizeOptions() => ['Small', 'Medium', 'Large'];
  List<String> _getSweetnessOptions() => ['0%', '25%', '50%', '75%', '100%'];
  List<String> _getEspressoShotOptions() => ['0', '1', '2', '3', '4'];
  List<String> _getSyrupOptions() => ['Brown Sugar', 'Caramel'];
  List<String> _getCondimentOptions() =>
      ['Boba', 'Coffee Jelly', 'Earl Grey Jelly'];
  List<String> _getFoamToppingOptions() => ['Cheese Foam', 'Salted Cream Foam'];
  List<String> _getTemperatureOptions() => ['Hot', 'Iced'];

  // Reset button functionality
  void _resetSelections() {
    setState(() {
      _selectedSize = null;
      _selectedSweetness = null;
      _selectedSyrup = null;
      _selectedCondiment = null;
      _selectedTemperature = null;
      _selectedFoamTopping = null;
      _selectedEspressoShots = 0;
      _quantity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menuName),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey, // Assign formKey to the form
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/images/${widget.menuName}.png',
                    height: 200),
              ),
              SizedBox(height: 16),
              Text(widget.menuName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),

              // Common options for all categories
              _buildDropdown('Select Size', _selectedSize, _getSizeOptions(),
                  (value) {
                setState(() => _selectedSize = value);
              }),
              _buildDropdown('Select Sweetness', _selectedSweetness,
                  _getSweetnessOptions(), (value) {
                setState(() => _selectedSweetness = value);
              }),

              // Display additional options based on the category
              if (widget.category == 'Coffee') ...[
                _buildDropdown(
                    'Select Syrup', _selectedSyrup, _getSyrupOptions(),
                    (value) {
                  setState(() => _selectedSyrup = value);
                }),
                _buildCounter('Espresso Shots', _selectedEspressoShots,
                    (value) {
                  setState(() => _selectedEspressoShots = value);
                }),
              ] else if (widget.category == 'Tea') ...[
                _buildDropdown('Select Condiment', _selectedCondiment,
                    _getCondimentOptions(), (value) {
                  setState(() => _selectedCondiment = value);
                }),
              ] else if (widget.category == 'Seasonal Drinks') ...[
                _buildDropdown('Select Temperature', _selectedTemperature,
                    _getTemperatureOptions(), (value) {
                  setState(() => _selectedTemperature = value);
                }),
                _buildDropdown('Select Foam Topping', _selectedFoamTopping,
                    _getFoamToppingOptions(), (value) {
                  setState(() => _selectedFoamTopping = value);
                }),
              ],

              // Quantity Selector
              SizedBox(height: 16),
              _buildCounter('Quantity', _quantity, (value) {
                setState(() => _quantity = value);
              }),

              SizedBox(height: 20),
              // Bottom buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _validateAndSaveForm,
                    child: Text('Choose'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _resetSelections,
                    child: Text('Reset'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build dropdown widget
  Widget _buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 18)),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text(label),
          items: items
              .map((item) =>
                  DropdownMenuItem<String>(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
          validator: (value) => value == null ? 'Please select $label' : null,
        ),
        SizedBox(height: 16),
      ],
    );
  }

  // Build counter for Quantity or Espresso Shots
  Widget _buildCounter(String label, int value, ValueChanged<int> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:', style: TextStyle(fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the entire row
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => onChanged(value > 0 ? value - 1 : 0),
            ),
            SizedBox(
              width: 40, // Fixed width to ensure the text stays centered
              child: Center(
                child: Text('$value', style: TextStyle(fontSize: 18)),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => onChanged(value + 1),
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
