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
    print(result.stdout);

    sleep(const Duration(seconds: 5));
  }

  static Future<void> editF2B() async {
    String bantime = IhmPrincipale.saisieString("le temps de ban");
    String findtime = IhmPrincipale.saisieString("le temps de findtime");
    int maxretry = IhmPrincipale.saisieInt("le nombre de tentatives possibles");
    ProcessResult result =
        await ProcessF2B.editF2B(bantime, findtime, maxretry);
    print("Modifications appliquées avec succé");
    print(result.stdout);
    print(result.stderr);
    sleep(const Duration(seconds: 2));
  }

  static Future<void> banIP() async {
    String ip = IhmPrincipale.saisieString("l'IP que vous souhaitez bannir.");
    ProcessF2B.banIP(ip);
    print("L'ip $ip a été bannie correctement");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> unbanIP() async {
    String ip = IhmPrincipale.saisieString("l'IP que vous souhaitez débannir.");
    ProcessF2B.unbanIP(ip);
    print("L'ip $ip a été débannie correctement");
    sleep(const Duration(seconds: 2));
  }
}
