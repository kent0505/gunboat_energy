import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KanaCon extends ChangeNotifier {
  double kanaUroven = 24;
  double kanaZaryad = 54;
  double zdRa = 0;

  double shkan = 42;
  double h1kan = 17;
  double h2kan = 17;
  double h3kan = 17;
  double h4kan = 17;
  double h5kan = 17;

  // ДОП
  double h6kan = 0;
  double h7kan = 0;
  double h8kan = 0;
  double h9kan = 0;
  double h10kan = 0;
  double h11kan = 0;

  bool shdust = false;
  bool h1dust = false;
  bool h2dust = false;
  bool h3dust = false;
  bool h4dust = false;
  bool h5dust = false;

  // ДОП
  bool h6dust = false;
  bool h7dust = false;
  bool h8dust = false;
  bool h9dust = false;
  bool h10dust = false;
  bool h11dust = false;

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

  double newartacost = 0;
  double newsignalcost = 0;
  double newaptechkacost = 0;
  double newshockcost = 0;
  double newobstrelcost = 0;
  double newdimcost = 0;
  double newkrittericost = 0;
  double newbrikcost = 0;
  double newpultcost = 0;
  double newbullitcost = 0;

  double artacost = 3;
  double signalcost = 2;
  double aptechkacost = 6;
  double shockcost = 7;
  double obstrelcost = 10;
  double dimcost = 2;
  double krittericost = 8;
  double brikcost = 6;
  double pultcost = 8;
  double bullitcost = 3;

  double artilery = 0;
  double signal = 0;
  double aptechka = 0;
  double shock = 0;
  double obstrel = 0;
  double dim = 0;
  double kritteri = 0;
  double brik = 0;
  double pult = 0;
  double bullit = 0;

  late SharedPreferences prefs;

  Future<void> loadFromPrefs() async {
    prefs = await SharedPreferences.getInstance();

    kanaUroven = prefs.getDouble('kanaUroven') ?? kanaUroven;
    // kanaZaryad = prefs.getDouble('kanaZaryad') ?? kanaZaryad;
    shkan = prefs.getDouble('shkan') ?? shkan;
    h1kan = prefs.getDouble('h1kan') ?? h1kan;
    h2kan = prefs.getDouble('h2kan') ?? h2kan;
    h3kan = prefs.getDouble('h3kan') ?? h3kan;
    h4kan = prefs.getDouble('h4kan') ?? h4kan;
    h5kan = prefs.getDouble('h5kan') ?? h5kan;
    h6kan = prefs.getDouble('h6kan') ?? h6kan;
    h7kan = prefs.getDouble('h7kan') ?? h7kan;
    h8kan = prefs.getDouble('h8kan') ?? h8kan;
    h9kan = prefs.getDouble('h9kan') ?? h9kan;
    h10kan = prefs.getDouble('h10kan') ?? h10kan;
    h11kan = prefs.getDouble('h11kan') ?? h11kan;

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
    if (kanaZaryad != kanaUroven * 2 + 10) kanaZaryad = kanaUroven * 2 + 10;
    if (kanaUroven == 21) kanaZaryad = 51;
    if (kanaUroven == 22) kanaZaryad = 52;
    if (kanaUroven == 23) kanaZaryad = 53;
    if (kanaUroven == 24) kanaZaryad = 54;
    kanaZaryad += (((shkan + h1kan + h2kan + h3kan + h4kan + h5kan) +
                (h6kan + h7kan + h8kan + h9kan + h10kan + h11kan)) /
            100) *
        kanaZaryad;
    kanaZaryad += zdRa * 3;
    if (artilery != 0 ||
        signal != 0 ||
        aptechka != 0 ||
        shock != 0 ||
        obstrel != 0 ||
        dim != 0 ||
        kritteri != 0 ||
        brik != 0 ||
        pult != 0 ||
        bullit != 0) {
      kanaZaryad -= newartacost;
      kanaZaryad -= newsignalcost;
      kanaZaryad -= newaptechkacost;
      kanaZaryad -= newshockcost;
      kanaZaryad -= newobstrelcost;
      kanaZaryad -= newdimcost;
      kanaZaryad -= newkrittericost;
      kanaZaryad -= newbrikcost;
      kanaZaryad -= newpultcost;
      kanaZaryad -= newbullitcost;
    }
  }

  void kana(String val) {
    if (val == 'lvl-' && kanaUroven >= 2) kanaUroven--;
    if (val == 'lvl+' && kanaUroven <= 23) kanaUroven++;
    saveToPrefs('kanaUroven', kanaUroven);
    percent();
    notifyListeners();
  }

  void zdaniya(String val) {
    if (val == 'zd-' && zdRa >= 1) zdRa--;
    if (val == 'zd+') zdRa++;
    percent();
    notifyListeners();
  }

  void dust(String val) {
    if (val == 'sh*') {
      if (shdust) {
        shkan = shkan / 2;
        shdust = false;
        shdustsize = 20;
      } else {
        shkan = shkan * 2;
        shdust = true;
        shdustsize = 25;
      }
    }
    if (val == 'h1*') {
      if (h1dust) {
        h1kan = h1kan / 2;
        h1dust = false;
        h1dustsize = 20;
      } else {
        h1kan = h1kan * 2;
        h1dust = true;
        h1dustsize = 25;
      }
    }
    if (val == 'h2*') {
      if (h2dust) {
        h2kan = h2kan / 2;
        h2dust = false;
        h2dustsize = 20;
      } else {
        h2kan = h2kan * 2;
        h2dust = true;
        h2dustsize = 25;
      }
    }
    if (val == 'h3*') {
      if (h3dust) {
        h3kan = h3kan / 2;
        h3dust = false;
        h3dustsize = 20;
      } else {
        h3kan = h3kan * 2;
        h3dust = true;
        h3dustsize = 25;
      }
    }
    if (val == 'h4*') {
      if (h4dust) {
        h4kan = h4kan / 2;
        h4dust = false;
        h4dustsize = 20;
      } else {
        h4kan = h4kan * 2;
        h4dust = true;
        h4dustsize = 25;
      }
    }
    if (val == 'h5*') {
      if (h5dust) {
        h5kan = h5kan / 2;
        h5dust = false;
        h5dustsize = 20;
      } else {
        h5kan = h5kan * 2;
        h5dust = true;
        h5dustsize = 25;
      }
    }

    // ДОП
    if (val == 'h6*') {
      if (h6dust) {
        h6kan = h6kan / 2;
        h6dust = false;
        h6dustsize = 20;
      } else {
        h6kan = h6kan * 2;
        h6dust = true;
        h6dustsize = 25;
      }
    }
    if (val == 'h7*') {
      if (h7dust) {
        h7kan = h7kan / 2;
        h7dust = false;
        h7dustsize = 20;
      } else {
        h7kan = h7kan * 2;
        h7dust = true;
        h7dustsize = 25;
      }
    }
    if (val == 'h8*') {
      if (h8dust) {
        h8kan = h8kan / 2;
        h8dust = false;
        h8dustsize = 20;
      } else {
        h8kan = h8kan * 2;
        h8dust = true;
        h8dustsize = 25;
      }
    }
    if (val == 'h9*') {
      if (h9dust) {
        h9kan = h9kan / 2;
        h9dust = false;
        h9dustsize = 20;
      } else {
        h9kan = h9kan * 2;
        h9dust = true;
        h9dustsize = 25;
      }
    }
    if (val == 'h10*') {
      if (h10dust) {
        h10kan = h10kan / 2;
        h10dust = false;
        h10dustsize = 20;
      } else {
        h10kan = h10kan * 2;
        h10dust = true;
        h10dustsize = 25;
      }
    }
    if (val == 'h11*') {
      if (h11dust) {
        h11kan = h11kan / 2;
        h11dust = false;
        h11dustsize = 20;
      } else {
        h11kan = h11kan * 2;
        h11dust = true;
        h11dustsize = 25;
      }
    }

    percent();
    notifyListeners();
  }

  void minus(String val) {
    if (val == 'sh-' && shkan >= 1 && !shdust) {
      shkan--;
      saveToPrefs('shkan', shkan);
    }
    if (val == 'h1-' && h1kan >= 1 && !h1dust) {
      h1kan--;
      saveToPrefs('h1kan', h1kan);
    }
    if (val == 'h2-' && h2kan >= 1 && !h2dust) {
      h2kan--;
      saveToPrefs('h2kan', h2kan);
    }
    if (val == 'h3-' && h3kan >= 1 && !h3dust) {
      h3kan--;
      saveToPrefs('h3kan', h3kan);
    }
    if (val == 'h4-' && h4kan >= 1 && !h4dust) {
      h4kan--;
      saveToPrefs('h4kan', h4kan);
    }
    if (val == 'h5-' && h5kan >= 1 && !h5dust) {
      h5kan--;
      saveToPrefs('h5kan', h5kan);
    }
    // ДОП
    if (val == 'h6-' && h6kan >= 1 && !h6dust) {
      h6kan--;
      saveToPrefs('h6kan', h6kan);
    }
    if (val == 'h7-' && h7kan >= 1 && !h7dust) {
      h7kan--;
      saveToPrefs('h7kan', h7kan);
    }
    if (val == 'h8-' && h8kan >= 1 && !h8dust) {
      h8kan--;
      saveToPrefs('h8kan', h8kan);
    }
    if (val == 'h9-' && h9kan >= 1 && !h9dust) {
      h9kan--;
      saveToPrefs('h9kan', h9kan);
    }
    if (val == 'h10-' && h10kan >= 1 && !h10dust) {
      h10kan--;
      saveToPrefs('h10kan', h10kan);
    }
    if (val == 'h11-' && h11kan >= 1 && !h11dust) {
      h11kan--;
      saveToPrefs('h11kan', h11kan);
    }
    percent();
    notifyListeners();
  }

  void plus(String val) {
    if (val == 'sh+' && shkan <= 41) {
      shkan++;
      saveToPrefs('shkan', shkan);
    }
    if (val == 'h1+' && h1kan <= 16) {
      h1kan++;
      saveToPrefs('h1kan', h1kan);
    }
    if (val == 'h2+' && h2kan <= 16) {
      h2kan++;
      saveToPrefs('h2kan', h2kan);
    }
    if (val == 'h3+' && h3kan <= 16) {
      h3kan++;
      saveToPrefs('h3kan', h3kan);
    }
    if (val == 'h4+' && h4kan <= 16) {
      h4kan++;
      saveToPrefs('h4kan', h4kan);
    }
    if (val == 'h5+' && h5kan <= 16) {
      h5kan++;
      saveToPrefs('h5kan', h5kan);
    }
    // ДОП
    if (val == 'h6+' && h6kan <= 16) {
      h6kan++;
      saveToPrefs('h6kan', h6kan);
    }
    if (val == 'h7+' && h7kan <= 16) {
      h7kan++;
      saveToPrefs('h7kan', h7kan);
    }
    if (val == 'h8+' && h8kan <= 16) {
      h8kan++;
      saveToPrefs('h8kan', h8kan);
    }
    if (val == 'h9+' && h9kan <= 16) {
      h9kan++;
      saveToPrefs('h9kan', h9kan);
    }
    if (val == 'h10+' && h10kan <= 16) {
      h10kan++;
      saveToPrefs('h10kan', h10kan);
    }
    if (val == 'h11+' && h11kan <= 16) {
      h11kan++;
      saveToPrefs('h11kan', h11kan);
    }
    percent();
    notifyListeners();
  }

  void sminus(String val) {
    if (val == 'art-' && artilery >= 1) {
      artilery--;
      artacost = artacost - 2;
      newartacost -= artacost;
      kanaZaryad += artacost;
    }
    if (val == 'sig-' && signal >= 1) {
      signal--;
      signalcost = signalcost - 1;
      newsignalcost -= signalcost;
      kanaZaryad += signalcost;
    }
    if (val == 'apt-' && aptechka >= 1) {
      aptechka--;
      aptechkacost = aptechkacost - 3;
      newaptechkacost -= aptechkacost;
      kanaZaryad += aptechkacost;
    }
    if (val == 'sho-' && shock >= 1) {
      shock--;
      shockcost = shockcost - 5;
      newshockcost -= shockcost;
      kanaZaryad += shockcost;
    }
    if (val == 'obs-' && obstrel >= 1) {
      obstrel--;
      obstrelcost = obstrelcost - 6;
      newobstrelcost -= obstrelcost;
      kanaZaryad += obstrelcost;
    }
    if (val == 'dim-' && dim >= 1) {
      dim--;
      dimcost = dimcost - 1;
      newdimcost -= dimcost;
      kanaZaryad += dimcost;
    }
    if (val == 'kri-' && kritteri >= 1) {
      kritteri--;
      krittericost = krittericost - 5;
      newkrittericost -= krittericost;
      kanaZaryad += krittericost;
    }
    if (val == 'bri-' && brik >= 1) {
      brik--;
      brikcost = brikcost - 12;
      newbrikcost -= brikcost;
      kanaZaryad += brikcost;
    }
    if (val == 'pul-' && pult >= 1) {
      pult--;
      pultcost = pultcost - 7;
      newpultcost -= pultcost;
      kanaZaryad += pultcost;
    }
    if (val == 'bul-' && bullit >= 1) {
      bullit--;
      bullitcost = bullitcost - 2;
      newbullitcost -= bullitcost;
      kanaZaryad += bullitcost;
    }
    percent();
    notifyListeners();
  }

  void splus(String val) {
    if (val == 'art+') {
      artilery++;
      kanaZaryad -= artacost;
      newartacost += artacost;
      artacost = artacost + 2;
    }
    if (val == 'sig+') {
      signal++;
      kanaZaryad -= signalcost;
      newsignalcost += signalcost;
      signalcost = signalcost + 1;
    }
    if (val == 'apt+') {
      aptechka++;
      kanaZaryad -= aptechkacost;
      newaptechkacost += aptechkacost;
      aptechkacost = aptechkacost + 3;
    }
    if (val == 'sho+') {
      shock++;
      kanaZaryad -= shockcost;
      newshockcost += shockcost;
      shockcost = shockcost + 5;
    }
    if (val == 'obs+') {
      obstrel++;
      kanaZaryad -= obstrelcost;
      newobstrelcost += obstrelcost;
      obstrelcost = obstrelcost + 6;
    }
    if (val == 'dim+') {
      dim++;
      kanaZaryad -= dimcost;
      newdimcost += dimcost;
      dimcost = dimcost + 1;
    }
    if (val == 'kri+') {
      kritteri++;
      kanaZaryad -= krittericost;
      newkrittericost += krittericost;
      krittericost = krittericost + 5;
    }
    if (val == 'bri+') {
      brik++;
      kanaZaryad -= brikcost;
      newbrikcost += brikcost;
      brikcost = brikcost + 12;
    }
    if (val == 'pul+') {
      pult++;
      kanaZaryad -= pultcost;
      newpultcost += pultcost;
      pultcost = pultcost + 7;
    }
    if (val == 'bul+') {
      bullit++;
      kanaZaryad -= bullitcost;
      newbullitcost += bullitcost;
      bullitcost = bullitcost + 2;
    }
    percent();
    notifyListeners();
  }
}
