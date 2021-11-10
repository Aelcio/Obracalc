import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Menu"),

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text("Orçamento")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Traços")
          ),
        ],
      ),
    );
  }
}
