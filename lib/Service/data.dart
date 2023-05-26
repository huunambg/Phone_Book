import 'package:path/path.dart';
import 'package:phone_book/class/transaction.dart';
import 'package:sqflite/sqflite.dart';

class Datahandler {
  Future<Database> initializeDBContact() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'phonebook.db'),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE Contact(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,phone TEXT NOT NULL)");
    }, version: 1);
  }

  Future<int> insertContactList(List<Contact> Contact) async {
    int result = 0;
    final Database db = await initializeDBContact();
    for (var Contact in Contact) {
      result = await db.insert('Contact', Contact.toMap());
    }
    return result;
  }

  Future<int> insertContact(Contact Contact) async {
    int result = 0;
    final Database db = await initializeDBContact();
    result = await db.insert('Contact', Contact.toMap());
    return result;
  }

  Future<List<Contact>> retrieveContact() async {
    final Database db = await initializeDBContact();
    final List<Map<String, Object?>> queryResult = await db.query("Contact");
    return queryResult.map((e) => Contact.fromMap(e)).toList();
  }

  Future<List<Contact>> retrieveContactSeach(String seach) async {
    final Database db = await initializeDBContact();
    final List<Map<String, Object?>> queryResult =
        await db.query("Contact", where: "name LIKE '%$seach%'");
    return queryResult.map((e) => Contact.fromMap(e)).toList();
  }

  Future<List<Map<String, dynamic>>> xContact() async {
    final Database db = await initializeDBContact();
    return db.query("Contact");
  }

  Future<void> updateContact(Contact _Contact) async {
    final Database db = await initializeDBContact();
    await db.update("Contact", _Contact.toMap(),
        where: "id = ?", whereArgs: [_Contact.id]);
  }

  Future<void> deleteContact(int id) async {
    final db = await initializeDBContact();
    await db.delete(
      'Contact',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<Database> initializeDBHistory() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'phonebook1.db'),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE History(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,phone TEXT NOT NULL,time TEXT NOT NULL)");
    }, version: 1);
  }

  Future<int> insertHistoryList(List<History> History) async {
    int result = 0;
    final Database db = await initializeDBHistory();
    for (var History in History) {
      result = await db.insert('History', History.toMap());
    }
    return result;
  }

  Future<int> insertHistory(History History) async {
    int result = 0;
    final Database db = await initializeDBHistory();
    result = await db.insert('History', History.toMap());
    return result;
  }

  Future<List<History>> retrieveHistory() async {
    final Database db = await initializeDBHistory();
    final List<Map<String, Object?>> queryResult = await db.query("History");
    return queryResult.map((e) => History.fromMap(e)).toList();
  }

  Future<List<Map<String, dynamic>>> xHistory() async {
    final Database db = await initializeDBHistory();
    return db.query("History");
  }

  Future<void> updateHistory(History _History) async {
    final Database db = await initializeDBHistory();
    await db.update("History", _History.toMap(),
        where: "id = ?", whereArgs: [_History.id]);
  }

  Future<void> deleteHistory(int id) async {
    final db = await initializeDBHistory();
    await db.delete(
      'History',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
