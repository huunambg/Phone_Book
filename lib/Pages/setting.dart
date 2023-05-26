import 'package:flutter/material.dart';
import 'package:phone_book/Pages/home.dart';
import 'package:phone_book/inapp_huawei/CustomWidgets/StorePage.dart';
import 'itemdrawer.dart';

class CaiDat extends StatefulWidget {
  const CaiDat({Key? key}) : super(key: key);

  @override
  State<CaiDat> createState() => _CaiDatState();
}

class _CaiDatState extends State<CaiDat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ItemDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text("Vip prenium"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text("Update vip"),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePageHW()));
                },
                child: Text("Buy")),
          )
        ],
      ),
    );
  }
}
