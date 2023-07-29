import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UronCon extends ChangeNotifier {
  double zuki = 673;
  double urZuk = 24;
  double count = 112;
  double brik = 377;
  double zukibrik = 0;

  double obwiyuron = 0;
  double uronsh = 32;
  double uronhr1 = 13;
  double uronhr2 = 13;
  double uronhr3 = 13;
  double uronhr4 = 13;
  double uronhr5 = 0;
  double uronhr6 = 0;
  double uronhr7 = 0;
  double uronhr8 = 0;
  double uronhr9 = 0;
  double uronhr10 = 0;
  double uronhr11 = 0;

  bool dSH = false;
  bool dHR1 = false;
  bool dHR2 = false;
  bool dHR3 = false;
  bool dHR4 = false;
  bool dHR5 = false;
  bool dHR6 = false;
  bool dHR7 = false;
  bool dHR8 = false;
  bool dHR9 = false;
  bool dHR10 = false;
  bool dHR11 = false;

  double shdustsize = 20;
  double h1dustsize = 20;
  double h2dustsize = 20;
  double h3dustsize = 20;
  double h4dustsize = 20;
  double h5dustsize = 20;

  // ДОП
  double h6dustsize = 20;
  double h7dustsize = 20;
  double h8dustsize = 20;
  double h9dustsize = 20;
  double h10dustsize = 20;
  double h11dustsize = 20;

  late SharedPreferences prefs;

  Future<void> loadFromPrefs() async {
    prefs = await SharedPreferences.getInstance();

    urZuk = prefs.getDouble('urZuk') ?? urZuk;
    count = prefs.getDouble('count') ?? count;
    uronsh = prefs.getDouble('uronsh') ?? uronsh;
    uronhr1 = prefs.getDouble('uronhr1') ?? uronhr1;
    uronhr2 = prefs.getDouble('uronhr2') ?? uronhr2;
    uronhr3 = prefs.getDouble('uronhr3') ?? uronhr3;
    uronhr4 = prefs.getDouble('uronhr4') ?? uronhr4;
    uronhr5 = prefs.getDouble('uronhr5') ?? uronhr5;
    uronhr6 = prefs.getDouble('uronhr6') ?? uronhr6;
    uronhr7 = prefs.getDouble('uronhr7') ?? uronhr7;
    uronhr8 = prefs.getDouble('uronhr8') ?? uronhr8;
    uronhr9 = prefs.getDouble('uronhr9') ?? uronhr9;
    uronhr10 = prefs.getDouble('uronhr10') ?? uronhr10;
    uronhr11 = prefs.getDouble('uronhr11') ?? uronhr11;

    notifyListeners();
  }

  void saveToPrefs(String key, double value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  void initial() async {
    await loadFromPrefs();
    percent();
  }

  void percent() {
    if (urZuk == 24) zuki = 673;
    if (urZuk == 23) zuki = 628;
    if (urZuk == 22) zuki = 583;
    if (urZuk == 21) zuki = 538;
    if (urZuk == 20) zuki = 489;
    if (urZuk == 19) zuki = 445;
    if (urZuk == 18) zuki = 404;
    if (urZuk == 17) zuki = 368;
    if (urZuk == 16) zuki = 334;
    if (urZuk == 15) zuki = 304;
    if (urZuk == 14) zuki = 276;
    if (urZuk == 13) zuki = 251;
    if (urZuk == 12) zuki = 228;
    if (urZuk == 11) zuki = 207;
    if (urZuk == 10) zuki = 189;
    if (urZuk == 9) zuki = 171;
    if (urZuk == 8) zuki = 156;
    if (urZuk == 7) zuki = 142;
    if (urZuk == 6) zuki = 129;
    if (urZuk == 5) zuki = 117;
    if (urZuk == 4) zuki = 106;
    if (urZuk == 3) zuki = 97;
    if (urZuk == 2) zuki = 88;
    if (urZuk == 1) zuki = 80;

    zuki = zuki * count;
    obwiyuron = uronsh +
        uronhr1 +
        uronhr2 +
        uronhr3 +
        uronhr4 +
        uronhr5 +
        uronhr6 +
        uronhr7 +
        uronhr8 +
        uronhr9 +
        uronhr10 +
        uronhr11;

    zuki += brik;
    zuki += zuki / 100 * obwiyuron;
    zukibrik = zuki * 11;
    zukibrik += zukibrik / 100 * 30;
  }

  void zukiFunc(String val) {
    if (val == 'lvl-' || val == 'lvl+') {
      if (val == 'lvl-' && urZuk >= 2) urZuk--;
      if (val == 'lvl+' && urZuk <= 23) urZuk++;
      saveToPrefs('urZuk', urZuk);
    } else {
      if (val == 'count-' && count >= 2) count--;
      if (val == 'count+' && count <= 111) count++;
      saveToPrefs('count', count);
    }

    percent();
    notifyListeners();
  }

  void dust(String val) {
    if (val == 'sh*') {
      if (dSH) {
        uronsh = uronsh / 2;
        dSH = false;
        shdustsize = 20;
      } else {
        uronsh = uronsh * 2;
        dSH = true;
        shdustsize = 25;
      }
    }
    if (val == 'hr1*') {
      if (dHR1) {
        uronhr1 = uronhr1 / 2;
        dHR1 = false;
        h1dustsize = 20;
      } else {
        uronhr1 = uronhr1 * 2;
        dHR1 = true;
        h1dustsize = 25;
      }
    }
    if (val == 'hr2*') {
      if (dHR2) {
        uronhr2 = uronhr2 / 2;
        dHR2 = false;
        h2dustsize = 20;
      } else {
        uronhr2 = uronhr2 * 2;
        dHR2 = true;
        h2dustsize = 25;
      }
    }
    if (val == 'hr3*') {
      if (dHR3) {
        uronhr3 = uronhr3 / 2;
        dHR3 = false;
        h3dustsize = 20;
      } else {
        uronhr3 = uronhr3 * 2;
        dHR3 = true;
        h3dustsize = 25;
      }
    }
    if (val == 'hr4*') {
      if (dHR4) {
        uronhr4 = uronhr4 / 2;
        dHR4 = false;
        h4dustsize = 20;
      } else {
        uronhr4 = uronhr4 * 2;
        dHR4 = true;
        h4dustsize = 25;
      }
    }
    if (val == 'hr5*') {
      if (dHR5) {
        uronhr5 = uronhr5 / 2;
        dHR5 = false;
        h5dustsize = 20;
      } else {
        uronhr5 = uronhr5 * 2;
        dHR5 = true;
        h5dustsize = 25;
      }
    }
    if (val == 'hr6*') {
      if (dHR6) {
        uronhr6 = uronhr6 / 2;
        dHR6 = false;
        h6dustsize = 20;
      } else {
        uronhr6 = uronhr6 * 2;
        dHR6 = true;
        h6dustsize = 25;
      }
    }
    if (val == 'hr7*') {
      if (dHR7) {
        uronhr7 = uronhr7 / 2;
        dHR7 = false;
        h7dustsize = 20;
      } else {
        uronhr7 = uronhr7 * 2;
        dHR7 = true;
        h7dustsize = 25;
      }
    }
    if (val == 'hr8*') {
      if (dHR8) {
        uronhr8 = uronhr8 / 2;
        dHR8 = false;
        h8dustsize = 20;
      } else {
        uronhr8 = uronhr8 * 2;
        dHR8 = true;
        h8dustsize = 25;
      }
    }
    if (val == 'hr9*') {
      if (dHR9) {
        uronhr9 = uronhr9 / 2;
        dHR9 = false;
        h9dustsize = 20;
      } else {
        uronhr9 = uronhr9 * 2;
        dHR9 = true;
        h9dustsize = 25;
      }
    }
    if (val == 'hr10*') {
      if (dHR10) {
        uronhr10 = uronhr10 / 2;
        dHR10 = false;
        h10dustsize = 20;
      } else {
        uronhr10 = uronhr10 * 2;
        dHR10 = true;
        h10dustsize = 25;
      }
    }
    if (val == 'hr11*') {
      if (dHR11) {
        uronhr11 = uronhr11 / 2;
        dHR11 = false;
        h11dustsize = 20;
      } else {
        uronhr11 = uronhr11 * 2;
        dHR11 = true;
        h11dustsize = 25;
      }
    }
    percent();
    notifyListeners();
  }

  void minus(String val) {
    if (val == 'sh-' && uronsh >= 1 && !dSH) {
      uronsh--;
      saveToPrefs('uronsh', uronsh);
    }
    if (val == 'hr1-' && uronhr1 >= 1 && !dHR1) {
      uronhr1--;
      saveToPrefs('uronhr1', uronhr1);
    }
    if (val == 'hr2-' && uronhr2 >= 1 && !dHR2) {
      uronhr2--;
      saveToPrefs('uronhr2', uronhr2);
    }
    if (val == 'hr3-' && uronhr3 >= 1 && !dHR3) {
      uronhr3--;
      saveToPrefs('uronhr3', uronhr3);
    }
    if (val == 'hr4-' && uronhr4 >= 1 && !dHR4) {
      uronhr4--;
      saveToPrefs('uronhr4', uronhr4);
    }
    if (val == 'hr5-' && uronhr5 >= 1 && !dHR5) {
      uronhr5--;
      saveToPrefs('uronhr5', uronhr5);
    }
    if (val == 'hr6-' && uronhr6 >= 1 && !dHR6) {
      uronhr6--;
      saveToPrefs('uronhr6', uronhr6);
    }
    if (val == 'hr7-' && uronhr7 >= 1 && !dHR7) {
      uronhr7--;
      saveToPrefs('uronhr7', uronhr7);
    }
    if (val == 'hr8-' && uronhr8 >= 1 && !dHR8) {
      uronhr8--;
      saveToPrefs('uronhr8', uronhr8);
    }
    if (val == 'hr9-' && uronhr9 >= 1 && !dHR9) {
      uronhr9--;
      saveToPrefs('uronhr9', uronhr9);
    }
    if (val == 'hr10-' && uronhr10 >= 1 && !dHR10) {
      uronhr10--;
      saveToPrefs('uronhr10', uronhr10);
    }
    if (val == 'hr11-' && uronhr11 >= 1 && !dHR11) {
      uronhr11--;
      saveToPrefs('uronhr11', uronhr11);
    }
    percent();
    notifyListeners();
  }

  void plus(String val) {
    if (val == 'sh+' && uronsh <= 31) {
      uronsh++;
      saveToPrefs('uronsh', uronsh);
    }
    if (val == 'hr1+' && uronhr1 <= 12) {
      uronhr1++;
      saveToPrefs('uronhr1', uronhr1);
    }
    if (val == 'hr2+' && uronhr2 <= 12) {
      uronhr2++;
      saveToPrefs('uronhr2', uronhr2);
    }
    if (val == 'hr3+' && uronhr3 <= 12) {
      uronhr3++;
      saveToPrefs('uronhr3', uronhr3);
    }
    if (val == 'hr4+' && uronhr4 <= 12) {
      uronhr4++;
      saveToPrefs('uronhr4', uronhr4);
    }
    if (val == 'hr5+' && uronhr5 <= 12) {
      uronhr5++;
      saveToPrefs('uronhr5', uronhr5);
    }
    if (val == 'hr6+' && uronhr6 <= 12) {
      uronhr6++;
      saveToPrefs('uronhr6', uronhr6);
    }
    if (val == 'hr7+' && uronhr7 <= 12) {
      uronhr7++;
      saveToPrefs('uronhr7', uronhr7);
    }
    if (val == 'hr8+' && uronhr8 <= 12) {
      uronhr8++;
      saveToPrefs('uronhr8', uronhr8);
    }
    if (val == 'hr9+' && uronhr9 <= 12) {
      uronhr9++;
      saveToPrefs('uronhr9', uronhr9);
    }
    if (val == 'hr10+' && uronhr10 <= 12) {
      uronhr10++;
      saveToPrefs('uronhr10', uronhr10);
    }
    if (val == 'hr11+' && uronhr11 <= 12) {
      uronhr11++;
      saveToPrefs('uronhr11', uronhr11);
    }
    percent();
    notifyListeners();
  }
}
