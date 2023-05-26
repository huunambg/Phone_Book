class Contact {
  int? id;
  String? name;
  String? phone;
  Contact({this.name, this.phone});

  Contact.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        phone = res["phone"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}

class History {
  int? id;
  String? name;
  String? phone;
  String? time;
  History({this.name, this.phone, this.time});

  History.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        phone = res["phone"],
        time = res["time"];

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'phone': phone, 'time': time};
  }
}
