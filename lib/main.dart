import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/data_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      theme: ThemeData(
        useMaterial3:
            true, // Enable Material 3 (optional, depending on your Flutter version)
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // Define a seed color
          brightness: Brightness.light, // Adjust for light or dark mode
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ), // Updated from headline4 to headlineMedium for compatibility
      ),
      home: MyNavigationBar(), // Set the Navigation Bar as the home widget
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    const HomePage(), // Home page
    const DataPage(), // Data page
    ContactPage(), // Contact page
  ];

  // Function to handle navigation bar taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.data_usage), label: 'Data'),
          NavigationDestination(
              icon: Icon(Icons.contact_page), label: 'Contact'),
        ],
      ),
    );
  }
}
