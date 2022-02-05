

 import 'package:flutter/material.dart';
 import 'soru.dart';
 // ignore: camel_case_types
 class testVeri {
   // ignore: prefer_final_fields
   int _soruIndex=0;
  
   // ignore: prefer_final_fields
   List <Soru> _soruBankasi=[
    Soru(soruMetni:'1.Titanic gelmiş geçmiş en büyük gemidir',soruYanit: false),
    Soru(soruMetni:'2.Dünyadaki tavuk sayısı insan sayısından fazladır',soruYanit: true),
    Soru(soruMetni:'3.Kelebeklerin ömrü bir gündür',soruYanit: false),
    Soru(soruMetni:'4.Dünya düzdür',soruYanit: false,),
    Soru(soruMetni:'5.Kaju fıstığı aslında bir meyvenin sapıdır',soruYanit: true),
    Soru(soruMetni:'6.Fatih Sultan Mehmet hiç patates yememiştir',soruYanit: true),
    Soru(soruMetni:'7.Fransızlar 80 demek için, 4 - 20 der',soruYanit: false)
  ];
  
  String getSoruMetni(){
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti(){
    return _soruBankasi[_soruIndex].soruYanit;
  }
  void soruArttir(){
    if(_soruIndex+1<_soruBankasi.length){
      _soruIndex ++;
    }
  }
  bool soruBittimi(){
    if(_soruIndex +1 >=_soruBankasi.length){
      return true;

  }else{
    return false;
  }
  }
  void testiSifirla(){
    _soruIndex=0;
  }

 }
 