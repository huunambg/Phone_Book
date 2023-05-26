import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phone_book/Pages/itemdrawer.dart';
import 'package:phone_book/Pages/root.dart';
import 'package:phone_book/Service/data.dart';
import 'package:phone_book/class/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ndialog/ndialog.dart';
import 'package:toastification/toastification.dart';

import 'add.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}

class lV extends StatefulWidget {
  const lV({Key? key}) : super(key: key);

  @override
  State<lV> createState() => _lVState();
}

class _lVState extends State<lV> {
  final suatencontrolor = TextEditingController();
  final suaphonecontrolor = TextEditingController();
  final timkiemcontrolor = TextEditingController();
  String? seach;
  @override
  void initState() {
    super.initState();
    this.handler = Datahandler();
    this.handler.initializeDBContact().whenComplete(() async {
      setState(() {});
    });
  }

  late Datahandler handler;
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: ItemDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text("Contact"),
        actions: [
          IconButton(
              onPressed: () {
                NDialog(
                  dialogStyle: DialogStyle(
                      titleDivider: true,
                      backgroundColor: Color.fromARGB(255, 231, 205, 195)),
                  title: Text(
                    "Seach Contact",
                    textAlign: TextAlign.center,
                  ),
                  content: TextField(
                    controller: timkiemcontrolor,
                    decoration: InputDecoration(labelText: "Enter Name"),
                    onChanged: (value) {
                      setState(() {
                        seach = value;
                      });
                    },
                  ),
                  actions: <Widget>[
                    TextButton(
                        child: Text("Quay lại"),
                        onPressed: () => Navigator.pop(context)),
                    TextButton(
                        child: Text("Seach"),
                        onPressed: () {
                          setState(() {
                            seach = timkiemcontrolor.text;
                          });
                          timkiemcontrolor.text = "";
                          Navigator.pop(context);
                        }),
                  ],
                ).show(context);
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Them()));
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
          future: seach == null
              ? this.handler.retrieveContact()
              : this.handler.retrieveContactSeach(seach!),
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue.shade200),
                    margin: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text("${snapshot.data![index].name}"),
                      subtitle: Text("${snapshot.data![index].phone}"),
                      onTap: (() {
                        NDialog(
                          dialogStyle: DialogStyle(titleDivider: true),
                          title: Text("${snapshot.data![index].name}"),
                          content: Text("Please choose function?"),
                          actions: <Widget>[
                            TextButton(
                                child: Text("Edit"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  namecontroller.text =
                                      snapshot.data![index].name.toString();
                                  phonecontroller.text =
                                      snapshot.data![index].phone.toString();
                                  NDialog(
                                    dialogStyle:
                                        DialogStyle(titleDivider: true),
                                    title: Text("Edit"),
                                    content: Container(
                                      height: h * 0.3,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: TextField(
                                              controller: namecontroller,
                                              decoration: InputDecoration(
                                                  labelText: "Name",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: TextField(
                                              controller: phonecontroller,
                                              decoration: InputDecoration(
                                                  labelText: "Phone",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text("Okay"),
                                          onPressed: () async {
                                            if (phonecontroller.text == "" ||
                                                namecontroller.text == "" ||
                                                int.tryParse(
                                                        phonecontroller.text) ==
                                                    null) {
                                              toastification.show(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 247, 47, 47),
                                                  icon: Icon(Icons.error),
                                                  pauseOnHover: true,
                                                  showProgressBar: true,
                                                  elevation: 10,
                                                  context: context,
                                                  title:
                                                      'Please check the input data !',
                                                  autoCloseDuration:
                                                      const Duration(
                                                          seconds: 3));
                                            } else {
                                              Contact o = new Contact();
                                              Datahandler x = new Datahandler();
                                              o.name = namecontroller.text;
                                              o.phone = phonecontroller.text;
                                              o.id = snapshot.data![index].id;
                                              await x.updateContact(o);
                                              setState(() {});
                                              Navigator.pop(context);
                                            }
                                          }),
                                      TextButton(
                                          child: Text("Close"),
                                          onPressed: () =>
                                              Navigator.pop(context)),
                                    ],
                                  ).show(context);
                                }),
                            TextButton(
                                child: Text("Delete"),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  NDialog(
                                    dialogStyle:
                                        DialogStyle(titleDivider: true),
                                    title:
                                        Text("${snapshot.data![index].name}"),
                                    content: Text("Do you want to delete?"),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text("Yes"),
                                          onPressed: () async {
                                            Datahandler x = new Datahandler();
                                            await x.deleteContact(int.parse(
                                                snapshot.data![index].id
                                                    .toString()));
                                            Navigator.pop(context);
                                            setState(() {});
                                            toastification.show(
                                                backgroundColor: Color.fromARGB(
                                                    255, 223, 58, 37),
                                                icon:
                                                    Icon(Icons.delete_forever),
                                                pauseOnHover: true,
                                                showProgressBar: true,
                                                elevation: 10,
                                                context: context,
                                                title:
                                                    'Deleted  ${snapshot.data![index].name}',
                                                autoCloseDuration:
                                                    const Duration(seconds: 3));
                                          }),
                                      TextButton(
                                          child: Text("No"),
                                          onPressed: () =>
                                              Navigator.pop(context)),
                                    ],
                                  ).show(context);
                                }),
                            TextButton(
                                child: Text("Close"),
                                onPressed: () => Navigator.pop(context)),
                          ],
                        ).show(context);
                      }),
                      leading: IconButton(
                          onPressed: () async {
                            FlutterPhoneDirectCaller.callNumber(
                                '${snapshot.data![index].phone.toString()}');
                            Datahandler x = new Datahandler();
                            History o = new History();
                            o.name = snapshot.data![index].name;
                            o.phone = snapshot.data![index].phone;
                            o.time = DateFormat('HH:mm, dd/MM/yyyy', 'vi_VN')
                                .format(DateTime.now())
                                .toString();
                            x.insertHistory(o);
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.call,
                            size: 30,
                          )),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person_pin_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
