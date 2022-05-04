import 'dart:io';

import 'intell.dart';

class IHM {
  static void hello() {
    print("\x1B[2J\x1B[0;0H");
    print("\x1B[1m" + "Bienvenue !" + "\x1B[0m");
  }

  static void goodbye() {
    print("\x1B[2J\x1B[0;0H");
    print("\x1B[1m" + "Aurevoir !" + "\x1B[0m");
  }

  static int saisiChoix(int nbchoix) {
    bool saisieValide = false;
    int i = -1;
    while (!saisieValide) {
      print("> Veuillez saisir une action (0-$nbchoix)");
      try {
        i = int.parse(stdin.readLineSync().toString());
        if (i >= 0 && i <= nbchoix) {
          saisieValide = true;
        } else {
          print("La saisie ne correspond à aucune action.");
        }
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return i;
  }

  static String saisieString(String butSaisi) {
    bool saisieValide = false;
    String s = "";
    while (!saisieValide) {
      print("> Veuillez saisir $butSaisi:");
      try {
        s = stdin.readLineSync().toString();
        saisieValide = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return s;
  }

  static Future<void> menu() async {
    int nb = -1;
    while (nb != 0) {
      print(
          "1. Modifier conf apache2\n2. Créer des utilisateurs\n3. Mettre en place la sécurité\n\n");
      nb = saisiChoix(3);
      if (nb == 1) {
        await IHM.menuApache();
      } else if (nb == 2) {
        await IHM.menuUsers();
      } else if (nb == 3) {
        await IHM.menuSecu();
      }
    }
  }

  static Future<void> menuApache() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "1. Créer une conf\n2. Modifier une conf\n3. Activer une conf\n4. Désactiver une conf\n5. Redémarrer apache2\n\n");
      nb = saisiChoix(5);
      if (nb == 1) {
        await IHM.createConf();
      } else if (nb == 2) {
        await IHM.editConf();
      } else if (nb == 3) {
        await IHM.turnOnConf();
      } else if (nb == 4) {
        await IHM.turnOffConf();
      } else if (nb == 5) {
        await IHM.redemApache();
      }
    }
  }

  static Future<void> menuUsers() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "1. Créer un utilisateur pour le mappage\n2. Créer un utilisateur virtuel\n\n");
      nb = saisiChoix(2);
      if (nb == 1) {
        await IHM.createMapUser();
      } else if (nb == 2) {
        await IHM.createUser();
      }
    }
  }

  static Future<void> menuSecu() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "1. Mettre en place Fail2Ban \n2. Modifier les paramètres de Fail2Ban\n3. Bannir une IP précise\n4. Débannir une IP précise\n\n");
      nb = saisiChoix(4);
      if (nb == 1) {
        await IHM.startF2B();
      } else if (nb == 2) {
        await IHM.editF2B();
      } else if (nb == 3) {
        await IHM.banIP();
      } else if (nb == 4) {
        await IHM.unbanIP();
      }
    }
  }

  static Future<void> createConf() async {
    String nom = saisieString("le nom de la conf que vous souhaitez créer.");
    Intell.createConf(nom);
  }

  static Future<void> turnOnConf() async {
    String nom = saisieString("le nom de la conf que vous souhaitez activer.");
    Intell.createConf(nom);
  }

  static Future<void> turnOffConf() async {
    String nom =
        saisieString("le nom de la conf que vous souhaitez désactiver.");
    Intell.createConf(nom);
  }

  static Future<void> editConf() async {
    String nom = saisieString("le nom de la conf que vous souhaitez modifier.");
    Intell.editConf(nom);
  }

  static Future<void> redemApache() async {
    print("redémarrage en cours");
    Intell.redemApache();
  }

  static Future<void> createMapUser() async {
    String nom = saisieString(
        "le nom d'utilisateur que vous souhaitez pour le mappage.");
    Intell.createMapUser(nom);
  }

  static Future<void> createUser() async {
    String nom = saisieString("le nom d'utilisateur que vous souhaitez créer.");
    Intell.createUser(nom);
  }

  static Future<void> startF2B() async {
    print("Lancement du service...");
    Intell.startF2B();
  }

  static Future<void> editF2B() async {
    String bantime = saisieString("le temps de ban");
    String findtime = saisieString("le temps de findtime");
    Intell.editF2B(bantime, findtime);
  }

  static Future<void> banIP() async {
    String ip = saisieString("l'IP que vous souhaitez bannir.");
    Intell.banIP(ip);
  }

  static Future<void> unbanIP() async {
    String ip = saisieString("l'IP que vous souhaitez débannir.");
    Intell.unbanIP(ip);
  }
}
