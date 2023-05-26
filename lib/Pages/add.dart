import 'package:flutter/material.dart';
import 'package:phone_book/Pages/root.dart';
import 'package:phone_book/Service/data.dart';
import 'package:phone_book/class/transaction.dart';
import 'package:toastification/toastification.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/safe_area_values.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'home.dart';

class Them extends StatefulWidget {
  const Them({Key? key, this.phone = ""}) : super(key: key);
  final String? phone;
  @override
  State<Them> createState() => themsate();
}

class themsate extends State<Them> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phone.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Add contact"),
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Root()));
            },
            icon: Icon(Icons.arrow_back_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Enter name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: "Enter phone",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                if (phoneController.text == "" ||
                    nameController.text == "" ||
                    int.tryParse(phoneController.text) == null) {
                  toastification.show(
                      backgroundColor: Color.fromARGB(255, 247, 47, 47),
                      icon: Icon(Icons.error),
                      pauseOnHover: true,
                      showProgressBar: true,
                      elevation: 10,
                      context: context,
                      title: 'Please check the input data !',
                      autoCloseDuration: const Duration(seconds: 3));
                } else {
                  Datahandler x = new Datahandler();
                  Contact o = new Contact();
                  o.name = nameController.text;
                  o.phone = phoneController.text;
                  await x.insertContact(o);

                  setState(() {
                    nameController.text = '';
                    phoneController.text = '';
                  });
                  toastification.show(
                      backgroundColor: Color.fromARGB(255, 47, 247, 73),
                      icon: Icon(Icons.calendar_today),
                      pauseOnHover: true,
                      showProgressBar: true,
                      elevation: 10,
                      context: context,
                      title: 'Add contact success',
                      autoCloseDuration: const Duration(seconds: 3));
                }
              },
              icon: Icon(Icons.add),
              label: Text("Add Contact"),
              style: ElevatedButton.styleFrom(),
            )
          ],
        )),
      ),
    );
  }
}
