import 'dart:io';
import 'IhmPrincipale.dart';
import 'ProcessF2B.dart';

class IhmF2B {
  static Future<void> startF2B() async {
    print("Lancement du service...");
    sleep(const Duration(seconds: 2));
    ProcessResult result = await ProcessF2B.startF2B();
    print(result.stderr);
    sleep(const Duration(seconds: 2));
  }

  static Future<void> printConf() async {
    print("Affichage en cours...");
    ProcessResult result = await ProcessF2B.getConf();
    result.stdout;
  }

  static Future<void> editF2B() async {
    String bantime = IhmPrincipale.saisieString("le temps de ban");
    String findtime = IhmPrincipale.saisieString("le temps de findtime");
    int maxretry = IhmPrincipale.saisieInt("le nombre de tentatives possibles");
    ProcessF2B.editF2B(bantime, findtime, maxretry);
  }

  static Future<void> banIP() async {
    String ip = IhmPrincipale.saisieString("l'IP que vous souhaitez bannir.");
    ProcessF2B.banIP(ip);
  }

  static Future<void> unbanIP() async {
    String ip = IhmPrincipale.saisieString("l'IP que vous souhaitez débannir.");
    ProcessF2B.unbanIP(ip);
  }
}
