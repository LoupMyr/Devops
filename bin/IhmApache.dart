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
    String route = IhmPrincipale.saisieString(" le chemin du directory");
    String directoryIndex =
        IhmPrincipale.saisieString(" le nom du fichier comme index.");
    String options =
        IhmPrincipale.saisieString("les options que vous souhitez.");
    String require = IhmPrincipale.saisieString(
        "all granted, all denied ou 'ip [l'ip extacte]'.");

    ProcessApache.editConf(nom, route, directoryIndex, options, require);
  }

  static Future<void> redemApache() async {
    print("Redémarrage en cours...");
    ProcessApache.redemApache();
  }
}
