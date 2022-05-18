import 'dart:io';

import 'IhmPrincipale.dart';
import 'ProcessApache.dart';

class IhmApache {
  static Future<void> createConf() async {
    String nom = IhmPrincipale.saisieString(
        "le nom de la conf que vous souhaitez créer.");
    print("Lancement...");
    ProcessResult result = await ProcessApache.createConf(nom);
    print("Création terminé !");
    print(result.stderr);
    print(result.stdout);
    sleep(const Duration(seconds: 2));
  }

  static Future<void> turnOnConf() async {
    String nom = IhmPrincipale.saisieString(
        "le nom de la conf que vous souhaitez activer.");
    ProcessApache.createConf(nom);
  }

  static Future<void> turnOffConf() async {
    String nom = IhmPrincipale.saisieString(
        "le nom de la conf que vous souhaitez désactiver.");
    ProcessApache.createConf(nom);
  }

  static Future<void> editConf() async {
    String nom = IhmPrincipale.saisieString(
        "le nom de la conf que vous souhaitez modifier.");
    ProcessApache.editConf(nom);
  }

  static Future<void> redemApache() async {
    print("Redémarrage en cours...");
    ProcessApache.redemApache();
  }
}
