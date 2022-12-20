import 'package:beefit/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final int age;
  final double height;
  final double weight;
  final String photoUrl;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
    required this.photoUrl,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState(
        name: name,
        email: email,
        age: age,
        height: height,
        weight: weight,
        photoUrl: photoUrl,
      );
}

class _ProfilePageState extends State<ProfilePage> {
  final String name;
  final String email;
  final int age;
  final double height;
  final double weight;
  final String photoUrl;
  int _selectedIndex = 0;

  _ProfilePageState({
    required this.name,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
    required this.photoUrl,
  });

  void _onItemTapped(int index) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 300,
            color: Colors.grey[200],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://this-person-does-not-exist.com/img/avatar-796f2700adb942342f62c69e9aff949a.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Age'),
            trailing: Text(age.toString()),
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('Height'),
            trailing: Text('$height cm'),
          ),
          ListTile(
            leading: Icon(Icons.line_weight),
            title: Text('Weight'),
            trailing: Text('$weight kg'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food/Exercise',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feedback',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
