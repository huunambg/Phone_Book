import 'package:intl/intl.dart';
import 'package:phone_book/Service/data.dart';
import 'package:phone_book/class/transaction.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:ndialog/ndialog.dart';
import 'huongdan.dart';
import 'add.dart';
import 'setting.dart';
import 'itemdrawer.dart';

class Quaysonhanh extends StatefulWidget {
  const Quaysonhanh({Key? key}) : super(key: key);

  @override
  State<Quaysonhanh> createState() => _QuaysonhanhState();
}

class _QuaysonhanhState extends State<Quaysonhanh> {
  final n1controller = TextEditingController();
  String nambt = ' ';
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: ItemDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text("Dialing"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              readOnly: true,
              controller: n1controller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
          SizedBox(height: 10),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Them(
                              phone: n1controller.text,
                            )));
              },
              child: Text('$nambt')),
          SizedBox(height: 10),
          // ElevatedButton.icon(
          //   onPressed: () async {
          //     FlutterPhoneDirectCaller.callNumber('${n1controller.text}');
          //     Datahandler x = new Datahandler();
          //     History o = new History();
          //     o.name = "No name";
          //     o.phone = n1controller.text;
          //     o.time = DateFormat('HH:mm, dd/MM/yyyy', 'vi_VN')
          //         .format(DateTime.now())
          //         .toString();
          //     x.insertHistory(o);
          //     setState(() {});
          //   },
          //   icon: Icon(
          //     Icons.call,
          //     size: 30,
          //   ),
          //   label: Text('Call', style: TextStyle(fontSize: 20)),
          // ),

          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '1';

                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('1'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '2';
                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('2'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '3';

                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('3'))),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '4';

                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('4'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '5';

                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('5'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '6';
                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('6'))),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '7';

                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('7'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '8';

                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('8'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '9';

                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('9'))),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '*';
                          });
                        },
                        child: Text('*'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '0';

                            nambt = 'Add to contacts';
                          });
                        },
                        child: Text('0'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '#';
                          });
                        },
                        child: Text('#'))),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            // n1controller.text = ' ';
                            if (n1controller.text.length != 0) {
                              String s = n1controller.text;
                              n1controller.text =
                                  s = s.substring(0, s.length - 1);
                            } else {
                              nambt = '  ';
                            }
                          });
                        },
                        child: Text(
                          'X',
                          style: TextStyle(color: Colors.red),
                        ))),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      FlutterPhoneDirectCaller.callNumber(
                          '${n1controller.text}');
                      Datahandler x = new Datahandler();
                      History o = new History();
                      o.name = "No name";
                      o.phone = n1controller.text;
                      o.time = DateFormat('HH:mm, dd/MM/yyyy', 'vi_VN')
                          .format(DateTime.now())
                          .toString();
                      x.insertHistory(o);
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.call,
                      size: 30,
                    ),
                    label: Text('', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.03,
          )
        ],
      ),
    );
  }
}
