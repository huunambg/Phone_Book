import 'package:phone_book/Service/data.dart';
import 'package:phone_book/class/transaction.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:ndialog/ndialog.dart';
import 'huongdan.dart';
import 'add.dart';
import 'setting.dart';
// class Customseach extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: Icon(Icons.keyboard_return));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<Contact> hihiHehe = [];
//     for (var item in tContact) {
//       if (item.name.toString().toLowerCase().contains(query.toLowerCase())) {
//         hihiHehe.add(item);
//       }
//     }

//     return ListView.builder(
//         itemCount: hihiHehe.length,
//         itemBuilder: ((context, index) {
//           final result = hihiHehe[index];
//           return ListTile(
//             title: Text("${result.name}"),
//             subtitle: Text("${result.phone}"),
//             leading: IconButton(
//               onPressed: () async {
//                 FlutterPhoneDirectCaller.callNumber('${result.phone}');
//                 _lichsu.namels = result.name;
//                 // _lichsu.phonels = result.phone;
//                 _lichsu.TG = DateTime.now();
//                 llichsu.add(_lichsu);
//                 _lichsu = Lichsu(namels: 'Không Tên', phonels: '', TG: null);
//               },
//               icon: Icon(Icons.call),
//             ),
//             trailing: Icon(Icons.person_pin_outlined),
//             onLongPress: () {
//               // showTopSnackBar(
//               //   context,
//               //   CustomSnackBar.success(
//               //     message:
//               //         "Đã thêm ${result.name} vào danh sách yêu thích (+_+)",
//               //   ),
//               // );
//               _yeuthich.name22 = result.name;
//               // _yeuthich.phone22 = result.phone;
//               yyeuthich.add(_yeuthich);
//               _yeuthich = yeuthich(name22: '', phone22: '');
//             },
//           );
//         }));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // Contact: implement buildResults
//     throw UnimplementedError();
//   }
// }
