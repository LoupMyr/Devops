import 'dart:io';
import 'IhmPrincipale.dart';
import 'ProcessF2B.dart';

class IhmF2B {
  static Future<void> menuSecurite() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "0. Retour\n1. Mettre en place Fail2Ban \n2. Afficher la conf\n3. Modifier les paramètres de votre conf\n4. Bannir une IP précise\n5. Débannir une IP précise\n\n");
      nb = IhmPrincipale.saisiChoix(5);
      if (nb == 1) {
        await IhmF2B.startF2B();
      } else if (nb == 2) {
        await IhmF2B.printConf();
      } else if (nb == 3) {
        await IhmF2B.editF2B();
      } else if (nb == 4) {
        await IhmF2B.banIP();
      } else if (nb == 5) {
        await IhmF2B.unbanIP();
      }
    }
  }

  static Future<void> startF2B() async {
    print("Lancement du service...");
    sleep(const Duration(seconds: 2));
    await ProcessF2B.startF2B();
    print("Mise en place effectuée");
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
    await ProcessF2B.editF2B(bantime, findtime, maxretry);
    print("Modifications appliquées avec succès");
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
