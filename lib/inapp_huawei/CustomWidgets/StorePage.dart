/*
    Copyright 2020-2022. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'package:flutter/material.dart';

import 'Consumables.dart';
import 'NonConsumables.dart';
import 'Subscriptions.dart';
import '../const.dart';
import '../utils/spref.dart';

class HomePageHW extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageHW> {
  int coin = 0;
  int buyCoin = 0;
  void updateData() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int? intCoin = await SPref.instance.getInt(keyCoin);

      if (intCoin == null) {
        SPref.instance.setInt(keyCoin, 10);
        intCoin = 10;
      }

      int? intBuyCoin = await SPref.instance.getInt(keyBuyCoin);

      if (intBuyCoin == null) {
        SPref.instance.setInt(keyBuyCoin, 0);
        intBuyCoin = 0;
      }

      setState(() {
        coin = intCoin!;
        buyCoin = intBuyCoin!;
      });
    });
  }

  void plusCoin(int posion) {
    SPref.instance.setInt(keyCoin, coin + posion);
    setState(() {
      coin += posion;
    });
  }

  void plusBuyCoin(int coin) {
    SPref.instance.setInt(keyBuyCoin, coin + buyCoin);
    setState(() {
      buyCoin += coin;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    updateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text('Store'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildCoin(),

              Consumables(pushCoin: (int posion) {
                plusCoin(posion);
              }, pushBuyCoin: (int coin) {
                plusBuyCoin(coin);
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey[400],
                ),
              ),
              //NonConsumables(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey[400],
                ),
              ),
              Subscriptions(pushCoin: (int posion) {
                plusCoin(posion);
              }),
            ],
          ),
        ));
  }

  Widget _buildBuyCoin() {
    return Card(
      color: Color.fromARGB(255, 50, 167, 185),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 70,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: Color(0xff6557ff),
              child: SizedBox(
                width: 60,
                height: 60,
              ),
            ),
            Text(
              "${buyCoin}",
              maxLines: 1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.yellow),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCoin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Card(
          color: Color(0xfff29732),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  color: Colors.brown,
                  child: SizedBox(
                    width: 60,
                    height: 60,
                  ),
                ),
                Text(
                  "${coin}",
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.yellow),
                )
              ],
            ),
          ),
        ),
        _buildBuyCoin(),
      ],
    );
  }
}
