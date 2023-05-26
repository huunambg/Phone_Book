import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ndialog/ndialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:phone_book/Pages/root.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';
import 'huongdan.dart';

class ItemDrawer extends StatefulWidget {
  const ItemDrawer({super.key});

  @override
  State<ItemDrawer> createState() => _ItemDrawerState();
}

class _ItemDrawerState extends State<ItemDrawer> {
  File? _image;
  String? _imagePath;
  @override
  void initState() {
    super.initState();
    _loadImageFromPrefs();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = 'avatar.png';
      final imageFile = File('${appDir.path}/$fileName');
      await imageFile.writeAsBytes(await pickedFile.readAsBytes());
      setState(() {
        _image = imageFile;
        _imagePath = imageFile.path;
      });
      _saveImageToPrefs(_imagePath!);
    }
  }

  // Hàm lưu đường dẫn đến ảnh vào SharedPreferences
  Future<void> _saveImageToPrefs(String path) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('imagePath', path);
  }

  // Hàm đọc đường dẫn đến ảnh từ SharedPreferences
  Future<void> _loadImageFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('imagePath');
    if (path != null) {
      setState(() {
        _imagePath = path;
        _image = File(path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Container(
              margin: EdgeInsets.only(top: 15, left: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Hiển thị cửa sổ chọn ảnh,
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SafeArea(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.photo_library,
                                        color: Colors.orange),
                                    title: Text(
                                      'Select photo from gallery',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Outfit",
                                          color: Colors.black87),
                                    ),
                                    onTap: () async {
                                      await _pickImage(ImageSource.gallery);
                                      await _loadImageFromPrefs();
                                      setState(() {});
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Root()));
                                      toastification.show(
                                          backgroundColor:
                                              Color.fromARGB(255, 25, 220, 255),
                                          icon: Icon(
                                              Icons.question_answer_rounded),
                                          pauseOnHover: true,
                                          showProgressBar: true,
                                          elevation: 10,
                                          context: context,
                                          title:
                                              'New photo updated, please exit the app and re-enter to show it',
                                          autoCloseDuration:
                                              const Duration(seconds: 3));
                                      await _loadImageFromPrefs();
                                    },
                                  )
                                ]));
                          });
                    },
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.teal,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            accountEmail: Text("Thank you for using us"),
            currentAccountPicture: CircleAvatar(
              radius: 60,
              child: Container(
                height: 120,
                width: 120,
                child: (_image == null
                    ? Text('')
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ))),
              ),
            ),
          ),
          ListTile(
            hoverColor: Colors.red,
            title: Text('Support'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Huongdan()));
            },
            onLongPress: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            hoverColor: Colors.red,
            title: Text('Back up'),
            onLongPress: () {
              Navigator.pop(context);
            },
            onTap: () {
              NDialog(
                dialogStyle: DialogStyle(
                    titleDivider: true,
                    backgroundColor: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(20)),
                title: Text("Hi, Hello you"),
                content: Text("Back up is updating !"),
                actions: <Widget>[
                  TextButton(
                      child: Text("back"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ).show(context);
            },
          ),
          ListTile(
            hoverColor: Colors.red,
            title: Text('Exit'),
            onLongPress: () {
              Navigator.pop(context);
            },
            onTap: () {
              NDialog(
                dialogStyle: DialogStyle(
                    titleDivider: true,
                    backgroundColor: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(20)),
                title: Text("Hi, Hello you"),
                content: Text("Do you want exit to app?"),
                actions: <Widget>[
                  TextButton(
                      child: Text("Yes"),
                      onPressed: () {
                        SystemNavigator.pop();
                      }),
                  TextButton(
                      child: Text("No"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ).show(context);
            },
          )
        ],
      ),
    );
  }
}
