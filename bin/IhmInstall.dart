import 'dart:io';

import 'ProcessInstall.dart';

class IhmInstall {
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
