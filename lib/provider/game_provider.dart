// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:taboo/logger.dart';

class Game extends ChangeNotifier {
  //----------------------------------- Variables
  Duration _gameDuration = const Duration(seconds: 120);

  int _numberOfRounds = 4;
  int _numberOfPass = 3;
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
  List<Map> _teamList = [];

  late List<Map> shuffledList;

  late Map _currentTeam;
  int _teamIndex = 0;
  int _roundIndex = 1;
  bool _endOfGame = false;
  //------------ end of varibales area

  //----------------- getters

  int get gameDuration => _gameDuration.inSeconds;
  List<Map> get teamList => _teamList;
  List<Map> get words => shuffledList;
  Map get currentTeam => _currentTeam;
  int get numberOfRounds => _numberOfRounds;
  int get numberOfPass => _numberOfPass;
  int get roundIndex => _roundIndex;
  bool get endOfGame => _endOfGame;
  int get teamIndex => _teamIndex;
  //------------------- end of getters

//* ------------- functions

  void startGame() {
    _endOfGame = false;
    shuffledList = _words;
    shuffledList.shuffle();
    _teamIndex = 0;
    _roundIndex = 1;
    for (var team in _teamList) {
      team["pass"] = _numberOfPass;
    }
    _currentTeam = _teamList[_teamIndex];
    notifyListeners();
  }

  void nextRound() {
    if (roundIndex == numberOfRounds && teamIndex == teamList.length - 1) {
      logger.wtf("End");
      _endOfGame = true;
      notifyListeners();
    } else {
      _teamIndex = 0;
      _currentTeam = _teamList[_teamIndex];
      _roundIndex++;
      notifyListeners();
    }
  }

  void changeTeam() {
    if (_teamIndex < _teamList.length - 1) {
      _teamIndex++;
      _currentTeam = _teamList[_teamIndex];
      notifyListeners();
    } else {
      nextRound();
    }
  }

  void setGameDuration(int val) {
    _gameDuration = Duration(seconds: val);
  }

  void setNumberOfPass(int val) {
    _numberOfPass = val;
  }

  void setNumberOfRounds(int val) {
    _numberOfRounds = val;
  }

  void addTeam(String teamName) {
    _teamList.add(
      {
        "teamName": teamName,
        "teamScore": 0,
      },
    );
  }

  void resetGame() {
    _teamList = [];
  }

  void shuffleWords() {
    _words.shuffle();
  }

  void increaseScore(Map team) {
    team["teamScore"] += 1;
    notifyListeners();
  }

  void decreaseScore(Map team) {
    team["teamScore"] -= 1;
    notifyListeners();
  }

  void usePass(Map team) {
    team["pass"]--;
    notifyListeners();
  }
}
