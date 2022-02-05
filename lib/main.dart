// ignore_for_file: deprecated_member_use, dead_code

import 'package:flutter/material.dart';

import 'constants.dart';
// ignore: unused_import
import 'soru.dart';
// ignore: unused_import
import 'test_veri.dart';

void main() => runApp(const BilgiTesti());

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: const SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({Key? key}) : super(key: key);

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  testVeri test_1 = testVeri();
  void butonFonksionu() {
    if (test_1.soruBittimi() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: const Text("BRAVO TESTİ BİTİRDİNİZ"),
            // content:  const Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: const Text("Başa dön"),
                onPressed: () {
                  setState(() {
                    test_1.testiSifirla();
                    secimler = [];
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        test_1.soruArttir();
        test_1.getSoruYaniti() == soruIconu
            ? secimler.add(kDogruIcon)
            : secimler.add(kYanlisIcon);
      });
    }
  }

  bool? soruIconu;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Wrap(
            // ignore: prefer_const_literals_to_create_immutables
            spacing: 3,
            children: secimler,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: const Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        soruIconu = false;
                        butonFonksionu();
                        // ignore: unused_local_variable
                      },
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: const Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            butonFonksionu();
                            soruIconu = true;
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
