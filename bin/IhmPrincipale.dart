import 'dart:io';
import 'IhmApache.dart';
import 'IhmFail2Ban.dart';
import 'IhmFtp.dart';
import 'IhmInstall.dart';

class IhmPrincipale {
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

  static int saisieInt(String butSaisi) {
    bool saisieValide = false;
    int s = 0;
    while (!saisieValide) {
      print("> Veuillez saisir $butSaisi:");
      try {
        s = int.parse(stdin.readLineSync().toString());
        saisieValide = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return s;
  }

  static Future<void> menuPrincipal() async {
    int nb = -1;
    while (nb != 0) {
      print(
          "0. Quitter\n1. Modifier conf apache2\n2. Config de Pure-FTPD\n3. Mettre en place la sécurité\n4. Installer des services\n\n");
      nb = saisiChoix(4);
      if (nb == 1) {
        await IhmPrincipale.menuApache();
      } else if (nb == 2) {
        await IhmPrincipale.menuFtp();
      } else if (nb == 3) {
        await IhmPrincipale.menuSecurite();
      } else if (nb == 4) {
        await IhmPrincipale.menuInstall();
      }
    }
  }

  static Future<void> menuApache() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "0. Retour\n1. Créer une conf\n2. Modifier une conf\n3. Activer une conf\n4. Désactiver une conf\n5. Redémarrer apache2\n\n");
      nb = saisiChoix(5);
      if (nb == 1) {
        await IhmApache.createConf();
      } else if (nb == 2) {
        await IhmApache.editConf();
      } else if (nb == 3) {
        await IhmApache.turnOnConf();
      } else if (nb == 4) {
        await IhmApache.turnOffConf();
      } else if (nb == 5) {
        await IhmApache.redemApache();
      }
    }
  }

  static Future<void> menuFtp() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "0. Retour\n1. Vérifier l'éxistance de 60puredb\n2. Créer le lien symbolique \"60puredb\" \n3. Créer un utilisateur pour le mappage\n4. Créer un utilisateur virtuel\n\n");
      nb = saisiChoix(4);
      if (nb == 1) {
        await IhmFtp.verifyLnS();
      } else if (nb == 2) {
        await IhmFtp.createLnS();
      } else if (nb == 3) {
        await IhmFtp.createMapUser();
      } else if (nb == 4) {
        await IhmFtp.createUser();
      }
    }
  }

  static Future<void> menuSecurite() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "0. Retour\n1. Mettre en place Fail2Ban \n2. Afficher la conf\n3. Modifier les paramètres de votre conf\n4. Bannir une IP précise\n5. Débannir une IP précise\n\n");
      nb = saisiChoix(5);
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

  static Future<void> menuInstall() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "0. Retour\n1. Installer apache2\n2. Installer Pure-FTPD\n3. Installer Fail2Ban\n4. Installer IpTables\n\n");
      nb = saisiChoix(4);
      if (nb == 1) {
        await IhmInstall.installApache();
      } else if (nb == 2) {
        await IhmInstall.installFtp();
      } else if (nb == 3) {
        await IhmInstall.installF2B();
      } else if (nb == 4) {
        await IhmInstall.installIpTables();
      }
    }
  }
}
