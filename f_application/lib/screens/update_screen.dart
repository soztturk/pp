import 'package:f_application/db/db_service.dart';
import 'package:f_application/model/mobilSetting.dart';
import 'package:f_application/screens/detailList.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  final MobilSetting? model;
  const UpdateScreen({Key? key, required this.model}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? adSoyad;
  String? telefon;
  String? yas;
  String? eMail;
  String? sehir;

  DbMobilSettings db = DbMobilSettings.instance;

  @override
  void initState() {
    super.initState();
    print(widget.model!.adSoyad);
    adSoyad = widget.model!.adSoyad;
    telefon = widget.model!.telefon;
    yas = widget.model!.yas;
    eMail = widget.model!.eMail;
    sehir = widget.model!.sehir;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Bilgi Güncelleme", style: TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => DetailsList()));
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                initialValue: adSoyad,
                onChanged: (String val) {
                  adSoyad = val;
                },
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  hintText: 'Lütfen Adınızı Giriniz.',
                  labelText: 'Ad Soyad',
                ),
              ),
              TextFormField(
                initialValue: telefon,
                onChanged: (String val) {
                  telefon = val;
                },
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.pink,
                  ),
                  hintText: 'Lütfen Telefon Giriniz',
                  labelText: 'Telefon',
                ),
              ),
              TextFormField(
                initialValue: yas,
                onChanged: (String val) {
                  yas = val;
                },
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  hintText: 'Lütfen Yaşınızı Giriniz',
                  labelText: 'Yaş',
                ),
              ),
              TextFormField(
                initialValue: eMail,
                onChanged: (String val) {
                  eMail = val;
                },
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.email,
                    color: Colors.pink,
                  ),
                  hintText: 'Lütfen E-Mail Giriniz',
                  labelText: 'E-Mail',
                ),
              ),
              TextFormField(
                initialValue: sehir,
                onChanged: (String val) {
                  sehir = val;
                },
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.location_on_rounded,
                    color: Colors.pink,
                  ),
                  hintText: 'Lütfen Şehir Giriniz',
                  labelText: 'Şehir',
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_box),
                color: Colors.pinkAccent,
                alignment: Alignment.bottomRight,
                onPressed: () {
                  db.updateMobilSetting(MobilSetting(
                    id: widget.model!.id,
                    adSoyad: adSoyad,
                    telefon: telefon,
                    yas: yas,
                    eMail: eMail,
                    sehir: sehir,
                  ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DetailsList()));
                },
                iconSize: 78,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
