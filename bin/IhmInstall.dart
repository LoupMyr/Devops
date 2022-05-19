import 'dart:io';
import 'IhmPrincipale.dart';
import 'ProcessInstall.dart';

class IhmInstall {
  static Future<void> menuInstall() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "0. Retour\n1. Installer apache2\n2. Installer Pure-FTPD\n3. Installer Fail2Ban\n4. Installer IpTables\n\n");
      nb = IhmPrincipale.saisiChoix(4);
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

  static Future<void> installApache() async {
    print("Lancement de l'instalation...");
    sleep(const Duration(seconds: 2));
    await ProcessInstall.installApache();
    print("Instalation terminé !");
    sleep(const Duration(seconds: 5));
  }

  static Future<void> installFtp() async {
    print("Lancement de l'instalation...");
    sleep(const Duration(seconds: 2));
    await ProcessInstall.installFtp();
    print("Instalation terminé !");
    sleep(const Duration(seconds: 5));
  }

  static Future<void> installF2B() async {
    print("Lancement de l'instalation...");
    sleep(const Duration(seconds: 2));
    await ProcessInstall.installF2B();
    print("Instalation terminé !");
    sleep(const Duration(seconds: 5));
  }

  static Future<void> installIpTables() async {
    print("Lancement de l'instalation...");
    sleep(const Duration(seconds: 2));
    await ProcessInstall.installIpTables();
    print("Instalation terminé !");
    sleep(const Duration(seconds: 5));
  }
}
