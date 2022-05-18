import 'dart:io';
import 'IhmPrincipale.dart';
import 'ProcessFtp.dart';

class IhmFtp {
  static Future<void> verifyLnS() async {
    print("Lancement de la vérification...");
    sleep(const Duration(seconds: 2));
    if (await ProcessFtp.verifyLnS()) {
      print("Lien symbolique déjà existant");
      sleep(const Duration(seconds: 5));
    } else {
      print("Lien symbolique pas encore créé");
      sleep(const Duration(seconds: 5));
    }
  }

  static Future<void> createLnS() async {
    if (!await ProcessFtp.verifyLnS()) {
      print("Création en cours...");
      sleep(const Duration(seconds: 2));
      ProcessResult result = await ProcessFtp.createLnS();
      print("Création terminé !");
      print(result.stderr);
      print(result.stdout);
      sleep(const Duration(seconds: 5));
    } else {
      print("Lien déjà existant");
    }
  }

  static Future<void> createMapUser() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez pour le mappage.");
    ProcessFtp.createMapUser(nom);
  }

  static Future<void> createUser() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez créer.");
    ProcessFtp.createUser(nom);
  }
}
