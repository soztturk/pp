import 'package:f_application/screens/detailList.dart';
import 'package:flutter/material.dart';
import 'screens/detail.dart';
import 'package:f_application/jsonExampTwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appTitle = 'Kişi Kayıt Formu';
    return MaterialApp(

        //title: appTitle,
        home: MyCustomForm());
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController adSoyad = new TextEditingController();
  TextEditingController telefon = new TextEditingController();
  TextEditingController yas = new TextEditingController();
  TextEditingController eMail = new TextEditingController();
  TextEditingController sehir = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Bilgi Girişi", style: TextStyle(fontSize: 20)),
      ),
      backgroundColor: Colors.pinkAccent,
      drawer: Container(
        width: 260,
        color: Colors.pink,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            /*ListTile(
              onTap: () {
                print("object");
              },
              
              title: Text("Deneme", style: TextStyle(fontSize: 25)),
              leading: Icon(Icons.access_alarm),
            ),*/
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text("Anasayfa",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.list,
                color: Colors.white,
              ),
              title: Text("Bilgi Listeleme",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DetailsList()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.list_alt_sharp,
                color: Colors.white,
              ),
              title: Text("Json 2",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => JsonExampTwo()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white54,
        margin: EdgeInsets.all(20),
        alignment: Alignment(5, 5),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                controller: adSoyad,
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black54,
                  ),
                  hintText: 'Lütfen Adınızı Giriniz.',
                  labelText: 'Ad Soyad',
                ),
              ),
              TextFormField(
                controller: telefon,
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.black54,
                  ),
                  hintText: 'Lütfen Telefon Giriniz',
                  labelText: 'Telefon',
                ),
              ),
              TextFormField(
                controller: yas,
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black54,
                  ),
                  hintText: 'Lütfen Yaşınızı Giriniz',
                  labelText: 'Yaş',
                ),
              ),
              TextFormField(
                controller: eMail,
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black54,
                  ),
                  hintText: 'Lütfen E-Mail Giriniz',
                  labelText: 'E-Mail',
                ),
              ),
              TextFormField(
                controller: sehir,
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.location_on_rounded,
                    color: Colors.black54,
                  ),
                  hintText: 'Lütfen Şehir Giriniz',
                  labelText: 'Şehir',
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_box,
                  color: Colors.pink,
                ),
                color: Colors.pinkAccent,
                alignment: Alignment.bottomRight,
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Details(
                                  adSoyad: adSoyad.text,
                                  eMail: eMail.text,
                                  sehir: sehir.text,
                                  telefon: telefon.text,
                                  yas: yas.text,
                                )));
                  });
                  debugPrint("");
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
