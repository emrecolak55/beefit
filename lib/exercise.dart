import 'package:flutter/material.dart';
import 'package:beefit/feedback.dart';
import 'package:beefit/profile.dart';
import 'package:beefit/food.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  // get what user typed
  final _textController = TextEditingController();
  //String stToInt = '';
  int userPost = 0;
  var _friendVal;
  List _friendsName = [
    'Shoulder',
    'Arm',
    'Brast',
    'Back Area',
    'Abdominal',
    'Leg',
  ];
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
            MaterialPageRoute(builder: (context) => FoodPage()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExercisePage()),
          );
          break;
        case 3:
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
              Text('Enter Your Exercise Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  )),
              SizedBox(
                height: 50,
              ),
              //food name field
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text("Select a category"),
                      value: _friendVal,
                      onChanged: (value) {
                        setState(() {
                          _friendVal = value;
                        });
                      },
                      items: _friendsName.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //calories field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Exercise Name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Time Spent (min)',
                      ),
                    ),
                  ),
                ),
              ),

              //calories field
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    userPost = int.parse(_textController.text) * 10;
                    //userPost = _textController.value as int;
                  });
                },
                color: Colors.purple,
                child: const Text("Calculate",
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 15,
              ),
              /*Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Total calories burnt: ',
                      semanticsLabel: "$userPost",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),*/
              Row(
                children: [
                  Expanded(
                      child: Container(
                          child: Center(
                    child: Text('Total calories burnt: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ))),
                  Expanded(
                      child: Container(
                          child: Center(
                              child: Text("$userPost",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 35))))),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Exercise',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feedback',
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
