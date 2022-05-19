import 'dart:io';
import 'IhmPrincipale.dart';
import 'ProcessApache.dart';

class IhmApache {
  static Future<void> menuApache() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "0. Retour\n1. Créer une conf\n2. Modifier une conf\n3. Activer une conf\n4. Désactiver une conf\n5. Redémarrer apache2\n\n");
      nb = IhmPrincipale.saisiChoix(5);
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
    print("Conf activée avec succée");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> turnOffConf() async {
    String nom = IhmPrincipale.saisieString(
        "le nom de la conf que vous souhaitez désactiver.");
    print("Création en cours...");
    sleep(const Duration(seconds: 2));
    ProcessApache.createConf(nom);
    print("Création terminée");
    sleep(const Duration(seconds: 2));
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
    print("Modifications appliquées");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> redemApache() async {
    print("Redémarrage en cours...");
    sleep(const Duration(seconds: 2));
    ProcessApache.redemApache();
  }
}
