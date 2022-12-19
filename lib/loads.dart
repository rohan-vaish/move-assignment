import 'package:flutter/material.dart';
import 'package:move/order.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String appBarTitle = 'Orders';
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        currentPage = index;
      });
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.black,
          title: Text(
            appBarTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Orders(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Orders', icon: Icon(Icons.local_shipping)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ],
          currentIndex: currentPage,
          onTap: onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ));
  }
}
