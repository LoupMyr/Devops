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

  static String saisieMDP() {
    bool saisieValide = false;
    String s = "";
    while (!saisieValide) {
      print("> Veuillez saisir le mot de passe :");
      try {
        stdin.echoMode = false;
        s = stdin.readLineSync().toString();
        saisieValide = true;
        stdin.echoMode = true;
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
        await IhmApache.menuApache();
      } else if (nb == 2) {
        await IhmFtp.menuFtp();
      } else if (nb == 3) {
        await IhmF2B.menuSecurite();
      } else if (nb == 4) {
        await IhmInstall.menuInstall();
      }
    }
  }
}
