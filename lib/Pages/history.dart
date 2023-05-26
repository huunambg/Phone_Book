import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phone_book/Pages/root.dart';
import 'package:phone_book/Service/data.dart';
import 'package:phone_book/class/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ndialog/ndialog.dart';
import 'package:toastification/toastification.dart';
import 'itemdrawer.dart';

class LS extends StatefulWidget {
  const LS({Key? key}) : super(key: key);
  @override
  State<LS> createState() => _LSState();
}

class _LSState extends State<LS> {
  late Datahandler handler;
  @override
  void initState() {
    super.initState();
    this.handler = Datahandler();
    this.handler.initializeDBHistory().whenComplete(() async {
      setState(() {});
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ItemDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text("History"),
      ),
      body: FutureBuilder(
          future: this.handler.retrieveHistory(),
          builder:
              (BuildContext context, AsyncSnapshot<List<History>> snapshot) {
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
                                            await x.deleteHistory(int.parse(
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
                      trailing: Text("${snapshot.data![index].time}"),
                      leading: Icon(
                        Icons.person_pin_outlined,
                        size: 30,
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
