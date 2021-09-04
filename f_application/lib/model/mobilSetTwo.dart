class MobilSettingsTwo {
  late int _userId;
  late int _id;
  late String _title;
  late String _body;

  MobilSettingsTwo(this._userId, this._id, this._title, this._body);

  int get userId => _userId;
  int get id => _id;
  String get title => _title;
  String get body => _body;

  set userId(int value) => value;
  set id(int value) => value;
  set title(String value) => value;
  set body(String value) => value;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_userId != null) {
      map["userId"] = _userId;
    }
    map["userId"] = _userId;
    map["id"] = _id;
    map["title"] = _title;
    map["body"] = _body;
    return map;
  }

  //DB  deki ile aynı isimde olması gerek büyük-küçük harfe dikkat et
  MobilSettingsTwo.fromObject(dynamic o) {
    this._userId = o["userId"];
    this._id = o["id"];
    this._title = o["title"];
    this._body = o["body"];
  }

  MobilSettingsTwo.fromJson(Map o) {
    this._userId = o["userId"];
    this._id = o["id"];
    this._title = o["title"];
    this._body = o["body"];
  }

  Map toJson() {
    return {"userId": _userId, "id": _id, "title": _title, "body": _body};
  }
}
