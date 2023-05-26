import 'package:phone_book/Pages/quaysonhanh.dart';
import 'package:phone_book/Pages/home.dart';
import 'package:phone_book/Service/data.dart';
import 'package:phone_book/class/transaction.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'add.dart';
//import 'banphim.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:ndialog/ndialog.dart';
import 'history.dart';
import 'huongdan.dart';
import 'add.dart';
import 'setting.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _root();
}

class _root extends State<Root> {
  int _currentIndex = 0;
  final tabs = [lV(), Quaysonhanh(), LS(), CaiDat()];
  String tt = 'Contact';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
            if (_currentIndex == 0) {
          
            } else if (_currentIndex == 1) {
           
            } else if (_currentIndex == 2) {
    
            } else if (_currentIndex == 3) {
             
            }
          });
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Contact"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.phone),
            title: Text("Dialing"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.history),
            title: Text("History"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.lock_outline_rounded),
            title: Text("Vip prenium"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
     
    );
  }
}
