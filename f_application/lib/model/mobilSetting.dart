class MobilSetting {
  int? id;
  String? adSoyad;
  String? telefon;
  String? yas;
  String? eMail;
  String? sehir;

  MobilSetting({
    this.id,
    required this.adSoyad,
    required this.telefon,
    required this.yas,
    required this.eMail,
    required this.sehir,
  });

  MobilSetting.fromObject(Map<String, dynamic> object) {
    this.id = object["Id"];
    this.adSoyad = object["AdSoyad"];
    this.telefon = object["Telefon"];
    this.yas = object["Yas"];
    this.eMail = object["EMail"];
    this.sehir = object["Sehir"];
  }

  Map<String, dynamic> toObject() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data["Id"] = this.id;
    data["AdSoyad"] = this.adSoyad;
    data["Telefon"] = this.telefon;
    data["Yas"] = this.yas;
    data["EMail"] = this.eMail;
    data["Sehir"] = this.sehir;
    return data;
  }
}














/*class MobilSetting1 {
  int _id;
  String _id2;
  String _abbrevation;
  String _active;
  String _configClass;
  String _databaseId;
  String _dbName;
  String _deleted;
  String _description;
  String _oskey;
  String _priority;
  String _proxy;
  String _proxyr;
  String _schoolName;

  MobilSetting1(
      this._id2,
      this._abbrevation,
      this._active,
      this._configClass,
      this._databaseId,
      this._dbName,
      this._deleted,
      this._description,
      this._oskey,
      this._priority,
      this._proxy,
      this._proxyr,
      this._schoolName);

  int get id => _id;
  String get id2 => _id2;
  String get abbrevation => _abbrevation;
  String get active => _active;
  String get configClass => _configClass;
  String get databaseId => _databaseId;
  String get dbName => _dbName;
  String get deleted => _deleted;
  String get description => _description;
  String get oskey => _oskey;
  String get priority => _priority;
  String get proxy => _proxy;
  String get proxyr => _proxyr;
  String get schoolName => _schoolName;

  set id2(String value) => value;
  set abbrevation(String value) => value;
  set active(String value) => value;
  set configClass(String value) => value;
  set databaseId(String value) => value;
  set dbName(String value) => value;
  set deleted(String value) => value;
  set description(String value) => value;
  set oskey(String value) => value;
  set priority(String value) => value;
  set proxy(String value) => value;
  set proxyr(String value) => value;
  set schoolName(String value) => value;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["id"] = _id;
    }
    map["Id2"] = _id2;
    map["Abbrevation"] = _abbrevation;
    map["Active"] = _active;
    map["ConfigClass"] = _configClass;
    map["DatabaseId"] = _databaseId;
    map["DbName"] = _dbName;
    map["Deleted"] = _deleted;
    map["Description"] = _description;
    map["Oskey"] = _oskey;
    map["Priority"] = _priority;
    map["Proxy"] = _proxy;
    map["Proxyr"] = _proxyr;
    map["SchoolName"] = _schoolName;
    return map;
  }

  

  MobilSetting1.fromJson(Map o) {
    this._id2 = o["id"];
    this._abbrevation = o["abbrevation"];
    this._active = o["active"];
    this._configClass = o["configclass"];
    this._databaseId = o["database_id"];
    this._dbName = o["dbname"];
    this._deleted = o["deleted"];
    this._description = o["description"];
    this._oskey = o["oskey"];
    this._priority = o["priority"];
    this._proxy = o["proxy"];
    this._proxyr = o["proxyr"];
    this._schoolName = o["schoolName"];
  }

  Map toJson() {
    return {
      "id": _id2,
      "abbrevation": _abbrevation,
      "active": _active,
      "configClass": _configClass,
      "databaseId": _databaseId,
      "dbName": _dbName,
      "deleted": _deleted,
      "description": _description,
      "colOskey": _oskey,
      "priority": _priority,
      "proxy": _proxy,
      "proxyr": _proxyr,
      "schoolName": _schoolName
    };
  }
}
*/