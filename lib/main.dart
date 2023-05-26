import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('vi_VN', null);
  runApp(HomePage());
}
