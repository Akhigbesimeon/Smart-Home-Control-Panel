import 'package:flutter/material.dart';
import 'widgets/room_tile.dart';

void main() {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartHome Control',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const SmartHomeScreen(),
    );
  }
}

class SmartHomeScreen extends StatefulWidget {
  const SmartHomeScreen({super.key});

  @override
  State<SmartHomeScreen> createState() => _SmartHomeScreenState();
}

class _SmartHomeScreenState extends State<SmartHomeScreen> {
  final List<Map<String, dynamic>> rooms = [
    {
      'name': 'Living Room',
      'icon': Icons.weekend,
      'color': Colors.orangeAccent,
      'devices': [
        {'name': 'Ceiling Light', 'isOn': false},
        {'name': 'Smart TV', 'isOn': true},
        {'name': 'Air Conditioner', 'isOn': false},
        {'name': 'Speaker System', 'isOn': true},
      ],
    },
    {
      'name': 'Bedroom',
      'icon': Icons.bed,
      'color': Colors.deepPurpleAccent,
      'devices': [
        {'name': 'Lamp', 'isOn': true},
        {'name': 'Heater', 'isOn': false},
        {'name': 'Ceiling Fan', 'isOn': true},
        {'name': 'Smart Blinds', 'isOn': false},
      ],
    },
    {
      'name': 'Kitchen',
      'icon': Icons.kitchen,
      'color': Colors.lightGreenAccent,
      'devices': [
        {'name': 'Refrigerator', 'isOn': true},
        {'name': 'Microwave', 'isOn': false},
        {'name': 'Coffee Maker', 'isOn': true},
        {'name': 'Oven', 'isOn': false},
      ],
    },
    {
      'name': 'Bathroom',
      'icon': Icons.bathtub,
      'color': Colors.lightBlueAccent,
      'devices': [
        {'name': 'Water Heater', 'isOn': false},
        {'name': 'Mirror Light', 'isOn': true},
        {'name': 'Smart Shower', 'isOn': false},
        {'name': 'Exhaust Fan', 'isOn': false},
      ],
    },
    {
      'name': 'Garage',
      'icon': Icons.garage,
      'color': Colors.redAccent,
      'devices': [
        {'name': 'Garage Door', 'isOn': false},
        {'name': 'Security Camera', 'isOn': true},
        {'name': 'Motion Sensor', 'isOn': true},
        {'name': 'Car Charger', 'isOn': false},
      ],
    },
    {
      'name': 'Home Office',
      'icon': Icons.computer,
      'color': Colors.amberAccent,
      'devices': [
        {'name': 'Desk Lamp', 'isOn': true},
        {'name': 'Air Purifier', 'isOn': false},
        {'name': 'Smart Speaker', 'isOn': true},
        {'name': 'Printer', 'isOn': false},
      ],
    },
  ];

  void toggleDevice(String roomName, String deviceName) {
    setState(() {
      final room = rooms.firstWhere((r) => r['name'] == roomName);
      final device = room['devices'].firstWhere((d) => d['name'] == deviceName);
      device['isOn'] = !device['isOn'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          '🏠 SmartHome Control',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return RoomTile(room: rooms[index], onToggle: toggleDevice);
        },
      ),
    );
  }
}
