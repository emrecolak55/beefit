import 'package:flutter/material.dart';
import 'package:beefit/inputs.dart';
import 'package:beefit/profile.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      name: 'John Doe',
                      email: 'john@example.com',
                      age: 30,
                      height: 75,
                      weight: 75,
                      photoUrl:
                          'https://this-person-does-not-exist.com/img/avatar-796f2700adb942342f62c69e9aff949a.jpg',
                    )),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodInputPage()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FeedbackPage()),
          );
          break;
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 242, 229),
      // ignore: prefer_const_literals_to_create_immutables
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 60,
              ),

              SizedBox(
                height: 10,
              ), // For space between
              Text('Feedback',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  )),
              SizedBox(
                height: 50,
              ),
              FutureBuilder(
                future:
                    _getDailyCalories(), // replace this with a function that retrieves the daily calorie data
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Daily Calories: ${snapshot.data}');
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future:
                    _getWeeklyCalories(), // replace this with a function that retrieves the weekly calorie data
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Weekly Calories: ${snapshot.data}');
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future:
                    _getCalorieDifference(), // replace this with a function that calculates the calorie difference
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.hashCode > 0) {
                      // Hashcode sil !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      return Text(
                          'You have taken more calories than you have burned during your exercises. Here is the difference: ${snapshot.data}. Next week, you should exercise more to reach your goals.');
                    } else if (snapshot.data.hashCode < 0) {
                      // Hashcode sil !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      return Text(
                          'You have burned more calories than you have taken during your exercises. Here is the difference: ${snapshot.data}. Keep up the good work!');
                    } else {
                      return Text(
                          'You have taken the same number of calories as you have burned during your exercises. Keep up the good work!');
                    }
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
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

  _getDailyCalories() {}

  _getWeeklyCalories() {}

  _getCalorieDifference() {}
}
