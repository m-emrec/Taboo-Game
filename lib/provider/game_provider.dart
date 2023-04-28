// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:taboo/logger.dart';

class Game extends ChangeNotifier {
  //----------------------------------- Variables
  final Duration _gameDuration = const Duration(seconds: 5);

  final List<Map> _words = [
    {
      "word": "Kitap",
      "taboos": ["Okumak", "Sayfa", "Kütüphane", "Yazar"]
    },
    {
      "word": "Futbol",
      "taboos": ["Top", "Stadyum", "Hakem", "Kale"]
    },
    {
      "word": "Kedi",
      "taboos": ["Pamuk", "Pençe", "Süt", "Miyavlamak"]
    },
    {
      "word": "Deniz",
      "taboos": ["Kum", "Dalgalar", "Gemi", "Plaj"]
    },
    {
      "word": "Kahve",
      "taboos": ["Bardak", "Telvesi", "Kafein", "Tatlı"]
    },
    {
      "word": "Köprü",
      "taboos": ["Nehir", "Trafiği", "Kıyı", "Bağlantı"]
    },
    {
      "word": "Tatil",
      "taboos": ["Plaj", "Dinlenmek", "Yenilenmek", "Turist"]
    },
    {
      "word": "Sinema",
      "taboos": ["Film", "Salon", "Bilet", "Popcorn"]
    },
    {
      "word": "Müzik",
      "taboos": ["Dinlemek", "Ses", "Nota", "Enstrüman"]
    },
    {
      "word": "Okyanus",
      "taboos": ["Dalga", "Denizaltı", "Mercan", "Yüzme"]
    },
    {
      "word": "Yazmak",
      "taboos": ["Kalem", "Sayfa", "Roman", "Makale"]
    },
    {
      "word": "Yürüyüş",
      "taboos": ["Ayakkabı", "Doğa", "Egzersiz", "Yol"]
    },
    {
      "word": "Gözlük",
      "taboos": ["Lens", "Göz", "Göz muayenesi", "Tasarım"]
    },
    {
      "word": "Hediye",
      "taboos": ["Paket", "Sevgi", "Almak", "Vermek"]
    },
    {
      "word": "Beyin",
      "taboos": ["Düşünmek", "Zeka", "Bellek", "Sinir"]
    },
    {
      "word": "Balık",
      "taboos": ["Yüzgeç", "Su", "Tatlı", "Deniz"]
    },
    {
      "word": "Saç",
      "taboos": ["Kuaför", "Fön", "Kırık", "Renk"]
    },
    {
      "word": "Saat",
      "taboos": ["Zaman", "Alarm", "Kronometre", "Akrep"]
    },
    {
      "word": "Çanta",
      "taboos": ["Deri", "Kemer", "Omuz", "Taşımak"]
    },
    {
      "word": "Araba",
      "taboos": ["Direksiyon", "Yolcu", "Benzin", "Lastik"]
    },
    {
      "word": "Dans",
      "taboos": ["Müzik", "Koreografi", "Adım", "Partner"]
    },
  ];

  /*
    [
      {
        "teamName" : "Green Team",
        "teamScore" : 10,
        },
        {
        "teamName" : "Yellow Team",
        "teamScore" : 25,
        }
    ]
  */
  final List<Map> _teamList = [
    {
      "teamName": "Green Team",
      "teamScore": 10,
    },
    {
      "teamName": "Yellow Team",
      "teamScore": 25,
    }
  ];

  late final int _teamCount;

  //------------ end of varibales area

  //----------------- getters

  int get gameDuration => _gameDuration.inSeconds;
  List<Map> get teamList => _teamList;
  List<Map> get words => _words;

  //------------------- end of getters

  // ------------- functions

  void shuffleWords() {
    _words.shuffle();
  }

  void increaseScore(String teamName) {
    Map team =
        _teamList.where((element) => element["teamName"] == teamName).first;
    team["teamScore"] += 1;
  }

  void decreaseScore(String teamName) {
    Map team =
        _teamList.where((element) => element["teamName"] == teamName).first;
    team["teamScore"] -= 1;
  }
}
