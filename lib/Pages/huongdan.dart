import 'package:flutter/material.dart';
import 'home.dart';

class Huongdan extends StatelessWidget {
  const Huongdan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Guide'),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.keyboard_return_outlined)),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                '''From the main screen, press the number keys to display the phone number you want to add to your contacts.
              Then press the left soft key corresponding to the function “Options”
               First you access the Contacts application
               - Contacts follow the instructions above.
            
            In the Contacts screen, use the scroll keys
            - arrow keys to find and select the item Find
            - Search then press Ok or soft key on the left
            - corresponds to the Select - Select . function
            
            Next you will be asked to enter the name of the phone number you have saved. Here you have 2 options: 1
              - If you remember the name of the phone number then enter it and press the Ok key or press the left soft key
              - corresponds to the Find - Search function. There will be 2 cases:
            1.1 - If you find the phone number with the name you saved, press the Call key
            - Dial key call key
            - Dial Key to make calls.
            1.2 - If you can't find the phone number with the name you saved, please press the left soft key
            - corresponds to the Show All function
            - View all to display all saved phone numbers in the contacts. Use the scroll keys
            - arrow keys to find and select the name of the phone number then press the Call key
            - Dial key to call key - Dial Key to make a call.2
            - If you don't remember the name of the phone number, press the left soft key
            - corresponds to the List function to display all the saved phone numbers in the contacts. Use the scroll keys
            - arrow keys to find and select the name of the phone number then press the Call key - Dial key call key - Dial Key to make a call ''',
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
